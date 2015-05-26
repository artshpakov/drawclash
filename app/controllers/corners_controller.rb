class CornersController < ApplicationController

  def show
    @corner = Corner.find_by!(slug: params[:id])
    @posts = @corner.posts.limit(10)
  end

  def create
    @corner = current_user.corners.create corner_params
    if @corner.persisted?
      Following.create user_id: current_user.id, entity_id: @corner.id, entity_type: Corner
      redirect_to corner_path(@corner)
    else
      Rails.logger.debug @corner.errors.messages
      redirect_to root_path
    end
  end


  protected

  def corner_params
    params.require(:corner).permit(:name, :description, :logo)
  end

end
