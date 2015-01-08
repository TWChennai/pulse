class AuthController < ApplicationController

  skip_before_filter :verify_authenticity_token, :authenticate

  def saml_callback
    auth = request.env['omniauth.auth']
    session[:user_id] = auth[:uid]
    redirect_to (params[:RelayState] || '/')
  end

  def logout
    session[:user_id] = nil
    redirect_to "https://thoughtworks.oktapreview.com"
  end
end
