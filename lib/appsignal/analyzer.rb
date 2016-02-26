module AppSignal
  class Analyzer
    attr_accessor :cache
    attr_accessor :site
    attr_accessor :config
    attr_accessor :config

    def initialize(site, config)
      self.cache = Dalli::Client.new(
        config['mecached']['host'], namespace: config['mecached']['namespace']
      )

      self.site   = site
      self.config = config
    end

    def start_console
      help_console

      binding.pry
    end

    def error_messages(samples_list)
      errors = {}

      samples_list.each do |sample_error|
        error = sample(sample_error['id'])

        exception = error['exception']['name']
        message   = error['exception']['message']

        error_key = "#{exception} => #{message}"

        errors[error_key] = 0 if errors[error_key].nil?

        errors[error_key] += 1
      end

      errors.sort_by { |_key, value| value }.reverse.to_h
    end

    def sample(id)
      get("samples/#{id}")
    end

    def sample_errors(options = {})
      get('samples/errors', options)
    end

    def samples(options = {})
      get('samples', options)
    end

    private

    def help_console
      puts "\n#{File.open('ConsoleReadme.txt').read}\n"
    end

    def site_id
      config['sites'][site]['id']
    end

    def get(path, options = {})
      url = "#{config['app-signal']['api-url']}/" \
            "#{site_id}/" \
            "#{path}.json" \
            "?token=#{config['app-signal']['token']}"

      options.each { |key, value| url += "&#{key}=#{value}" }

      rest_get_request(url)
    end

    def rest_get_request(url)
      cache_value = cache.get(url)

      return cache_value if cache_value

      puts " GET #{url}"

      cache.set(url, JSON.parse(RestClient.get(url)))

      cache.get(url)
    end
  end
end
