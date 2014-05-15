Rails.application.config.middleware.use OmniAuth::Builder do
  
  provider :facebook, '300798416763477', '824dcbd328c965ad0d0aea538eebcf71' , {:scope => 'email', :client_options => {:ssl => {:verify => false}}}
  
end