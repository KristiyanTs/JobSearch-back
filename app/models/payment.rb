class Payment < ApplicationRecord
  belongs_to :membership, optional: true

  after_create :add_credits
  before_update :update_credits

  def attach_info
    as_json.merge(
      student: membership.user,
      group: membership.group
    ) if membership
  end

  def add_credits
    credits_count = amount/membership.group.pricing.credit_price
    membership.update(credit: membership.credit + credits_count)
  end

  def update_credits
    if self.changes[:amount]
      change = self.changes[:amount][1] - self.changes[:amount][0]
      credits_count = change/membership.group.pricing.credit_price
      membership.update(credit: membership.credit + credits_count)
    end
  end
end
