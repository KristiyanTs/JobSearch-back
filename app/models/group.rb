class Group < ApplicationRecord
  belongs_to :teacher, class_name: "User", foreign_key: "user_id", optional: true
  belongs_to :pricing
  belongs_to :location, optional: true
  
  has_many :memberships, dependent: :destroy
  has_many :lessons, dependent: :destroy

  enum lesson: [:individual, :collective]
  
  def students
    memberships.map(&:user)
  end
end
