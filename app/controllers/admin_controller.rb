class AdminController < ApplicationController
  before_filter :set_body_class
  
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  def set_body_class
    @bodyClass = 'admin main'
  end
  
end