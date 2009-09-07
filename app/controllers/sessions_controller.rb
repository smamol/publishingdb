class SessionsController < ApplicationController
  skip_before_filter :authorization_required
  def create
    session[:password] = params[:password]
    redirect_back_or_default('/people/')
    
    if authorized? 
        notice = "You are now logged in"
    else
        notice = "Sorry, wrong password!"  
    end
    flash[:notice] = notice
      
  end
  
  
  def destroy
    reset_session
    flash[:notice] = "You have been logged out"
    redirect_back_or_default('/login')
  end
end
