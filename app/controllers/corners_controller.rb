class CornersController < ApplicationController

  def show
    @corner = Corner.find_by! slug: params[:id]
  end

  def create
    @corner = current_user.corners.create corner_params
    Rails.logger.debug @corner.errors.messages unless @corner.persisted?
    redirect_to root_path
  end


  protected

  def corner_params
    params.require(:corner).permit(:name, :description, :logo)
  end

end
