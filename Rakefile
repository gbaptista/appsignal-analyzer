require 'rest-client'
require 'pry'
require 'dalli'

require File.expand_path('../lib/appsignal/analyzer.rb', __FILE__)

config = YAML.load(File.open('config.yml').read)

if ARGV[0].to_s.empty?
  puts 'Choose a site: '

  config['sites'].keys.each.with_index do |site, i|
    puts " - [#{i + 1}] #{site}"
  end

  print '> '

  site = gets.strip
else
  site = ARGV[0]
end

site = (site.to_i ? config['sites'].keys[site.to_i - 1] : site)

AppSignal::Analyzer.new(site, config).start_console
