class IndexController < ApplicationController

  def index
    @corners = Corner.populated.limit(30)
    if current_user
      @followed_corners = current_user.follows
      @timeline         = Post.where(corner_id: @followed_corners.map(&:id)).limit(10)
    end
  end

end
