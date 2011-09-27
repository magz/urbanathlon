# Load the rails application
require File.expand_path('../application', __FILE__)

CmsTest::Application.configure do 
  config.action_mailer.delivery_method = :smtp
  
  config.action_mailer.smtp_settings = {
    :address        => "smtp.gmail.com",
    :port           =>  587,
    :domain         => "gmail.com",
    :authentication =>  "plain",
    :user_name      =>  "michael.magner",
    :password       =>  "",
    :enable_starttls_auto => true
    
  }
end


# Initialize the rails application
CmsTest::Application.initialize!
