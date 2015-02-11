# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers
class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  layout 'pulse'
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  # before_filter :authenticate

  private
  def authenticate
    if !(authorized?)
       redirect_to("/auth/saml?redirectUrl=#{URI::encode(request.path)}")
       return
    end
  end

  def authorized?
    !session[:user_id].nil?
  end
end
