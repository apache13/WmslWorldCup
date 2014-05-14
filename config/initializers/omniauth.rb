Rails.application.config.middleware.use OmniAuth::Builder do
  
  # OmniAuth.config.logger = Rails.logger
  
  
  provider :facebook, '300798416763477', '824dcbd328c965ad0d0aea538eebcf71' , {:scope => 'email', :client_options => {:ssl => {:verify => false}}}
  
  
  
  # OmniAuth.config.logger = Rails.logger

  #Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :facebook, '300788413431144', 'cd5a59160d36b020212f4e06f276f1e6'
  

end