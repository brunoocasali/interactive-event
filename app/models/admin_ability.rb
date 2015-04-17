class AdminAbility
  include CanCan::Ability

  def initialize(user)
    if user.admin? or user.root?
      can :manage, :all
    end
  end
end
