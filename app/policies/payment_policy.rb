class PaymentPolicy < ApplicationPolicy
  def create?
    user.admin? or (user.teacher? and self.record.payer_type == 'Membership')
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end