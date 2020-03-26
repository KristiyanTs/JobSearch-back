class UserPolicy < ApplicationPolicy
  def create?
    user.admin? || user.teacher?
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end