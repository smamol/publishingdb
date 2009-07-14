class <%= class_name %>Controller < ApplicationController
  
  # Make sure to move this to your applications controller
  include SuperSimpleAuthenticationSystem
  
  def create
    session[:password] = params[:password]
    flash[:notice] = "You have been authenticated"
    redirect_back_or_default('/')
  end
  
  def destroy
    reset_session
    flash[:notice] = "You have been logged out"
    redirect_back_or_default('/')
  end
end
