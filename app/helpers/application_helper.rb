module ApplicationHelper

  def reactize entry
    {
      id: entry.id,
      image: entry.image.thumb('280x').url,
      name: entry.user.name,
      avatar: entry.user.avatar,
      likesCount: entry.likes.count,
      liked: (current_user.presence && entry.liked_by?(current_user)),
      canDelete: can?(:delete, entry)
    }
  end

end
