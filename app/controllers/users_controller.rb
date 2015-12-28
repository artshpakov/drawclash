class UsersController < ApplicationController

  def create
    @user = User.new user_params
    if @user.save
      login(@user.name, @user.password)
    else
      Rails.logger.debug @user.errors.messages
    end
    redirect_to :back
  end


  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
