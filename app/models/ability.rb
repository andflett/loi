class Ability
  include CanCan::Ability

  def initialize(user)
    
    user ||= User.new
    
    if user.role == "member"
			can :read, [Post]
    end
    
    if user.role == "admin"
      can :manage, :all
    end
      
  end
end
