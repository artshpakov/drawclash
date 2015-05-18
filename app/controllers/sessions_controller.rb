class SessionsController < ApplicationController

  def create
    Rails.logger.debug('-- Invalid credentials') unless @user = login(params[:username], params[:password])
    redirect_to :back
  end

  def destroy
    logout
    redirect_to :back
  end

end
