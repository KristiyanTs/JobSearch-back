class LessonPolicy < ApplicationPolicy
  def create?
    user.admin? or user.teacher?
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end