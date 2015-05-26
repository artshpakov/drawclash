class Ability
  include CanCan::Ability

  def initialize user

    user ||= User.new

    if user.persisted?
      # entries
      can :post_entry, Battle do |battle|
        battle.open?
      end
      can :delete, Entry, user_id: user.id

      can :delete, Entry do |entry|
        entry.corner_id.in? user.corners.pluck(:id)
      end

      # posts
      can :post_to, Corner do |corner|
        corner.in? user.corners
      end
    end

  end
end
