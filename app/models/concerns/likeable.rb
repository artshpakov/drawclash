module Likeable

  extend ActiveSupport::Concern

  def liked_by? user
    likes.include? user.id if user.kind_of?(User)
  end

end
