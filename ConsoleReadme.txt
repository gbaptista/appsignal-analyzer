  AppSignal Analyzer

    AppSignal API Docs:

      - http://docs.appsignal.com/api/overview.html
      - http://docs.appsignal.com/api/samples.html
      - http://docs.appsignal.com/api/markers.html
      - http://docs.appsignal.com/api/graphs.html

    Show Sample:

      sample('56d01760776f727a7bb71d00')

    List Samples:

      samples

    List Error Samples:

      sample_errors
      sample_errors(exception: 'Example: NoMethodError')

    List Erros Messages Count:

      error_messages(sample_errors['log_entries'])

      error_messages(sample_errors(exception: 'Example: NoMethodError')['log_entries'])
