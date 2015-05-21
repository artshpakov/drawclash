class LikesController < ApplicationController

  before_action :find_entry


  def create
    @entry.likes.push current_user.id
    @entry.save
    render nothing: true, status: :created
  end

  def destroy
    @entry.likes_will_change!
    @entry.update likes: (@entry.likes - [current_user.id])
    render nothing: true, status: :no_content
  end


  private

  def find_entry
    @entry = Entry.find_by!(id: params[:entry_id])
  end

end
