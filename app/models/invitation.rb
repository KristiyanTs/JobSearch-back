class Invitation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :node
  belongs_to :role

  def send_to_user
    user = User.find_by(email: self.email)
    if user
      self.update(user: user)
    else
      # TODO
      # create a new user and send an invitation link 
      # to reset password and accept the invitation
    end
  end
end
