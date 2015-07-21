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
      can :update, Item { |item| item.try(:user) == user }
      can :destroy, Item { |item| item.try(:user) == user }
    elsif user.common?
      can :read, Item
    end
  end
end
