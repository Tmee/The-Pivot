class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :create, Business
    can :manage, Business, :id => user.business_id
    can :admin, Business, :id => user.business_id

    can :manage, User, :id => user.id

    if user.admin?
      can :manage, :all
    else
      can :read, :all
    end
  end
end