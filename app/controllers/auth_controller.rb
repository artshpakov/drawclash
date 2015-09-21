class AuthController < ApplicationController

  def signon
    begin
      if identity = Identity.find_or_create(env["omniauth.auth"].to_hash)
        signin_as identity.user
        Analytics.track(event: 'signon', user_id: identity.user.id, properties: {via: identity.provider})
      end
      redirect_to :back
    end
  end

  def signout
    Analytics.track(event: 'signout', user_id: current_user.id)
    session.clear
    redirect_to :back
  end


  protected

  def signin_as user
  	session[:user_id] = user.id
  end

end
