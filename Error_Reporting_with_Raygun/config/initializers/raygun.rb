Raygun.setup do |config|
  config.api_key = ENV['raygun_key']
  config.filter_parameters = Rails.application.config.filter_parameters

  # The default is Rails.env.production?
  config.enable_reporting = true #!Rails.env.development? && !Rails.env.test?
  #config.ignore << ['ZeroDivisionError']

  config.version = "1.0.0.4"
end
