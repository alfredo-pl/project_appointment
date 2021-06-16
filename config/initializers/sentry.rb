Sentry.init do |config|
    config.dsn = 'https://924b9c95897d43219469cd9dd1a7383d@o852551.ingest.sentry.io/5818828'
    config.breadcrumbs_logger = [:active_support_logger, :http_logger]
  
    # Set tracesSampleRate to 1.0 to capture 100%
    # of transactions for performance monitoring.
    # We recommend adjusting this value in production
    config.traces_sample_rate = 0.5
    # or
    config.traces_sampler = lambda do |context|
      true
    end
  end