class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :group

  has_many :payments, dependent: :nullify
  has_many :absences, dependent: :delete_all

  def attach_student
    as_json.merge(
      student: user
    )
  end
end
