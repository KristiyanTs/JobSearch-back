class Invitation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :node
  belongs_to :role

  before_save :assign_user

  def assign_user
    user = User.find_or_create_by(email: self.email)
  end
end
