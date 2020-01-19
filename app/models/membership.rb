class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :group

  has_many :payments, dependent: :nullify

  def attach_student
    
    as_json.merge(
      student: user,
      paid: payments.where(month: Date.today.strftime("%B").downcase).any?
    )
  end
end
