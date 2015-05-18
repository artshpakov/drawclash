class BattlesController < ApplicationController

  def show
    @battle = Battle.find_by! id: params[:id]
  end

  def create
    corner = Corner.find_by! slug: params[:corner_id]
    @battle = corner.battles.create(name: params[:battle][:name], open_until: 1.week.from_now)
    Rails.logger.debug @corner.errors.messages unless @battle.persisted?
    redirect_to corner_path(corner)
  end

end
