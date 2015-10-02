class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, CatEntry

    return unless user.present?

    if user.admin
      can :manage, User
      can :manage, CatEntry
    else
      can :create, CatEntry
      can :update, CatEntry, user_id: user.id
      can :destroy, CatEntry, user_id: user.id
      can :read, User, id: user.id
      can :update, User, id: user.id
    end
  end
end
