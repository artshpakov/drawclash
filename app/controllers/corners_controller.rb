class CornersController < ApplicationController

  def show
    @corner = Corner.find_by!(slug: params[:id])
  end

  def create
    @corner = current_user.corners.create corner_params
    if @corner.persisted?
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
