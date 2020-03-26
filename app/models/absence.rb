class Absence < ApplicationRecord
  belongs_to :membership
  belongs_to :lesson

  after_create :add_credits
  before_update :update_credits

  # add a credit if the user has warned us about an absence
  def add_credits
    return unless excused && membership.credit > 0
    membership.update(credit: membership.credit + 1)
  end

  # if we made a mistake when creating an absence
  def update_credits
    if self.changes[:excused] && membership.credit > 0
      if self.changes[:amount][1] && !self.changes[:amount][0] # excused from true to false
        membership.update(credit: membership.credit - 2)
      elsif !self.changes[:amount][1] && self.changes[:amount][0] # excused from false to true
        membership.update(credit: membership.credit + 2)
      end
    end
  end
end
