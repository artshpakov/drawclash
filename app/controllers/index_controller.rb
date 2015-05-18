class IndexController < ApplicationController

  def index
    @corners = Corner.populated.limit(30)
  end

end
