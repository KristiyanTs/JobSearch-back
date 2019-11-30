class Lesson < ApplicationRecord
  belongs_to :group
  belongs_to :teacher, class_name: "User", foreign_key: 'teacher_id'

  has_many :attendances
  has_many :students, through: :attendances, class_name: "User"


  def attach_info
    as_json.merge(
      teacher: teacher,
      group: group
    )
  end
end
