# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    elsif user.teacher?
      can :read, :all
      can :create, [Group, Membership, Payment, User]
      can :update, [Group, Payment, User]
      can :manage, [Absence, Attendance, Bug, Lesson]
    else
      can :read, :all
    end
    #   can :update, Article, :published => true
  end
end
