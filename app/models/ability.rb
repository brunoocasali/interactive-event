class Ability
  include CanCan::Ability

  def initialize(user)
    if user.root?
      can :manage, :all
    elsif user.admin?
      can :manage, :all
    elsif user.common?
      can :read, Item
      can :create, Item
      can :update, Item do |item|
        item.try(:user) == user
      end
      can :destroy, Item do |item|
        item.try(:user) == user
      end
    elsif user.common?
      can :read, Item
    end
  end
end
