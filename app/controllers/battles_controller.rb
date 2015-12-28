class BattlesController < ApplicationController

  ENTRIES_PER_PAGE = 20


  def show
    @battle = Battle.find_by! id: params[:id]
    @entries = @battle.entries.chronologically.limit ENTRIES_PER_PAGE
  end

  def create
    corner = Corner.find_by! slug: params[:corner_id]
    @battle = corner.battles.create name: params[:battle][:name]
    Rails.logger.debug @corner.errors.messages unless @battle.persisted?
    redirect_to corner_path(corner)
  end

end
