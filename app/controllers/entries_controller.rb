class EntriesController < ApplicationController

  def create
    if params[:entry] && params[:entry][:image]
      @entry = current_user.entries.create(image: params[:entry][:image], battle_id: params[:battle_id])
      Rails.logger.debug @entry.errors.messages unless @entry.persisted?
    end
    redirect_to :back
  end

end