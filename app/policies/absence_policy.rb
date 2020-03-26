class AbsencePolicy < ApplicationPolicy
  def create?
    p 18
    user.admin? || user.teacher?
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end