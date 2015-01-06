class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :manage, :all if user.admin?

    alias_action :update, :admin, :to => :admn
    alias_action :show, :index, :to => :usr
    can :create,  Business
    can :admn, Business, :id => user.business_id
    can :usr,  Business

    can :update, Listing, :business_id => user.business_id
    can :edit, Listing, :business_id => user.business_id
    can :show, Listing
    can :create, Listing, :business_id => user.business_id
    can :index, Listing

    alias_action :show, :update, :destroy, :to => :sud
    can :sud, User, :id => user.id
    can :update_business_owner, User, :business_id => user.business_id
    can :create, User
  end
end