class EntriesController < ApplicationController

  def create
    authorize! :post_entry, Battle.find_by!(id: params[:battle_id])
    if params[:entry] && params[:entry][:image]
      @entry = current_user.entries.create(image: params[:entry][:image], battle_id: params[:battle_id], corner_id: params[:corner_id])
      Rails.logger.debug @entry.errors.messages unless @entry.persisted?
    end
    redirect_to :back
  end

  def destroy
    Entry.destroy params[:id] if can? :delete, Entry.find(params[:id])
    render nothing: true, status: :no_content
  end

end
