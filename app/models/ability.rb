class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    if user.persisted?

      can :post_entry, Battle do |battle|
        battle.open?
      end

    end

  end
end
