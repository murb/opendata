# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :ensure_domain

  TheDomain = 'http://bodemlozeputten.nl'

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  def require_user
    unless current_user
      store_location
      flash[:notice] = "U dient ingelogd te zijn om deze pagina te benaderen."
      redirect_to new_user_session_url
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      flash[:notice] = "Deze pagina kunt u niet bereiken wanneer u ingelogd bent."
      redirect_to account_url
      return false
    end
  end
  
  def store_location
    session[:return_to] = request.request_uri
  end
  
  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
  
  def require_admin
    unless current_user && @current_user.admin
      store_location
      flash[:notice] = "U dient een administrator te zijn."
      redirect_to account_url
      return false
    end
  end

  def ensure_domain
    
    if request.env['HTTP_HOST'].include?("www.")
      redirect_to TheDomain, :status => 301
    end
  end
end
