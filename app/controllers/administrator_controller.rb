class AdministratorController < ApplicationController
  
  before_action :require_admin_permission 
  
  def index
  end
end
