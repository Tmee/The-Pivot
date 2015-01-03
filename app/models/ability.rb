class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :manage, :all if user.admin?

    alias_action :update, :admin, :to => :admn
    alias_action :create, :show, :index, :to => :usr
    can :admn, Business, :id => user.business_id
    can :usr,  Business

    can :update, Listing, :business_id => user.business_id
    can :edit, Listing, :business_id => user.business_id
    can :show, Listing, :business_id => user.business_id
    alias_action :show, :update, :destroy, :to => :sud
    can :sud, User, :id => user.id
    can :create, User
  end
end