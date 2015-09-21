class IndexController < ApplicationController

  POSTS_PER_PAGE = 10

  def index
    @corners = Corner.populated.limit(30)
    @timeline = if current_user
      Analytics.identify(user_id: current_user.id, traits: { email: "#{ current_user.email }" })
      @followed_corners = current_user.follows
      Post.where(corner_id: @followed_corners.map(&:id)).limit(POSTS_PER_PAGE)
    else
      Post.limit(POSTS_PER_PAGE)
    end
  end

end
