# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
WeatherApp::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => "stormsurge",
  :password => "stormsurge",
  :domain => "aqueous-fortress-8839.herokuapp.com/",
  :address => "smtp.sendgrid.net",
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true,
}