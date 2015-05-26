class Ability
  include CanCan::Ability

  def initialize user

    user ||= User.new

    if user.persisted?
      can :post_entry, Battle do |battle|
        battle.open?
      end
      can :delete, Entry, user_id: user.id

      can :delete, Entry do |entry|
        entry.corner_id.in? user.corners.pluck(:id)
      end
    end

  end
end
