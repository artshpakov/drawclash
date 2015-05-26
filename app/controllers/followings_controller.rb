class FollowingsController < ApplicationController

  def create
    Following.create user_id: current_user.id, entity_id: entity_id, entity_type: params[:entity_type]
    redirect_to :back
  end

  def destroy
    Following.where(user_id: current_user.id, entity_id: entity_id, entity_type: params[:entity_type]).delete_all
    redirect_to :back
  end


  private

  def entity_id
    params[:corner_id] # TODO more complex logic for multiple polymorphic entities
  end

end
