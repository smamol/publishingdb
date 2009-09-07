module SuperSimpleAuthenticationSystem  
  protected
  
  def authorization_required
    authorized? || access_denied
  end
  
  def access_denied
    store_location
    redirect_to :controller => 'sessions', :action => 'new'
  end
  
  def authorized?
    password = YAML::load(File.open("#{RAILS_ROOT}/config/super_simple_authentication.yml"))["password"]
    session[:password] == password
  end
  
  def store_location
    session[:return_to] = request.request_uri
  end  
  
  def redirect_back_or_default(default)
    session[:return_to] ? redirect_to(session[:return_to]) : redirect_to(default)
    session[:return_to] = nil
  end  
  
  def self.included(base)
    base.send :helper_method, :authorized?
  end  
end