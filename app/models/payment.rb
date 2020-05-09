class Payment < ApplicationRecord
  include ActiveModel::Validations

  belongs_to :recipient, optional: true, polymorphic: true
  belongs_to :payer, optional: true, polymorphic: true

  validate :must_be_positive, :must_not_be_between_teachers
  after_create :update_balance
  before_update :correct_balance

  def attach_info
    if payer && payer.class.name == 'Membership' 
      return as_json.merge(
        group: payer.group,
        payer: payer.user,
        recipient: recipient
      )
    else
      return as_json.merge(
        payer: payer,
        recipient: recipient
      )
    end
  end

  def must_be_positive
    errors.add(:base, "Payment's amount can't be negative.") if amount < 0
  end

  def must_not_be_between_teachers
    errors.add(:base, "Users can's transfer balance to other users.") if payer_type == recipient_type
  end

  def update_balance
    if payer && payer.class.name == 'Membership' 
      # update payer
      credits_count = amount.to_f/payer.group.pricing.credit_price.to_f
      new_credits = payer.credit + credits_count
      payer.update(credit: new_credits)

      # update recipient
      recipient.update(balance: recipient.balance + amount)
    elsif payer.class.name == "Academy" || payer&.role == 'teacher'
      # update payer
      payer.update(balance: payer.balance - amount)
      payer.update(credit: payer.credit + amount) unless payer.class.name == 'Academy'

      # update recipient
      recipient.update(balance: recipient.balance + amount)
      recipient.update(credit: recipient.credit - amount) unless recipient.class.name == 'Academy'
    end
  end

  def correct_balance
    if self.changes[:amount]
      change = self.changes[:amount][1] - self.changes[:amount][0]

      if payer && payer.class.name == 'Membership'
        credits_count = change/payer.group.pricing.credit_price
        new_credits = payer.credit + credits_count
        payer.update(credit: new_credits)
      elsif payer.class.name == "Academy" || payer&.role == 'teacher'
        payer.update(balance: payer.balance - change)
        recipient.update(balance: recipient.balance + change)
        recipient.update(credit: recipient.credit + change) unless payer.class.name == "Academy"
      end
    end
  end
end
