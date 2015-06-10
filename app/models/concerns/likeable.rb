module Likeable

  extend ActiveSupport::Concern

  def liked_by? user
    likes.include? user.id
  end

end
