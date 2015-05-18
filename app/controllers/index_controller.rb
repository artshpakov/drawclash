class IndexController < ApplicationController

  def index
    @corners = Corner.limit(30)
  end

end
