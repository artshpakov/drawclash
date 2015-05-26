class EntriesController < ApplicationController

  def create
    authorize! :post_entry, Battle.find_by!(params[:battle_id])
    if params[:entry] && params[:entry][:image]
      @entry = current_user.entries.create(image: params[:entry][:image], battle_id: params[:battle_id])
      Rails.logger.debug @entry.errors.messages unless @entry.persisted?
    end
    redirect_to :back
  end

  def destroy
    Entry.destroy params[:id] if can? :delete, Entry.find(params[:id])
    redirect_to :back
  end

end
