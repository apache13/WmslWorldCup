class AdministratorController < ApplicationController
  
  before_filter :require_admin_permission 
  
  def index
  end
end
