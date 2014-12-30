class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :create, Business
    can :manage, Business, :id => user.business_id
    can :home, Business, :id => user.business_id

    can :manage, User, :id => user.id
  end
end