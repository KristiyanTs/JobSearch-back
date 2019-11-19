class Lesson < ApplicationRecord
  belongs_to :group
  belongs_to :teacher, class_name: "User", foreign_key: 'user_id'

  has_many :attendances
  has_many :students, through: :attendances, class_name: "User"
end
