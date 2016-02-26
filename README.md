# AppSignal Analyzer

### AppSignal API Docs:
  - http://docs.appsignal.com/api/overview.html
  - http://docs.appsignal.com/api/samples.html
  - http://docs.appsignal.com/api/markers.html
  - http://docs.appsignal.com/api/graphs.html

### Requirements
  - [ruby](https://www.ruby-lang.org/en/)
  - [memcached](http://memcached.org)
  
  

How To Use

```
gem install bundler
bundle
cp config.yml.example config.yml
rake
```

##### Show Sample
```ruby
sample('56d01760776f727a7bb71d00')
```

##### List Samples
```ruby
samples
```

##### List Error Samples:
```ruby
sample_errors
sample_errors(exception: 'Example: NoMethodError')
```

##### List Errors Messages Count:
```ruby
error_messages(sample_errors['log_entries'])
error_messages(sample_errors(exception: 'Example: NoMethodError')['log_entries'])
```
