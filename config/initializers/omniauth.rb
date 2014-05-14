Rails.application.config.middleware.use OmniAuth::Builder do
  
  provider :facebook, 'APP_ID', 'SECRET_KEY' , {:scope => 'email', :client_options => {:ssl => {:verify => false}}}
  
end