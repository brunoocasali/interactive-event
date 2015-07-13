class AdminAbility
  include CanCan::Ability

  def initialize(user)
    can :manage, :all if user.admin? || user.root?
  end
end
