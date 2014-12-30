class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :create, Business
    can :manage, Business, :id => user.business_id
    can :home, Business, :id => user.business_id
    # raise "boom"
    # can :manage, Business   if user == @business_owner
    can :manage, User if user == @current_user
  end
end