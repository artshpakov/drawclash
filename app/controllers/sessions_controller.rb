class SessionsController < ApplicationController

  def create
    Rails.logger.debug('-- Invalid credentials') unless @user = login(params[:username], params[:password])
    redirect_to root_path
  end

  def destroy
    logout
    redirect_to root_path
  end

end
