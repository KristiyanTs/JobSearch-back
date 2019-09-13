class Invitation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :node
  belongs_to :role

  def send_to_user
    user = User.find_by(email: self.email)
    if user
      # TODO
      # check if this user already has the SAME invitation (same node, same scope) -> abort
      # check if this user already has this membership (same role, same scope) -> abort
      self.update(user: user)
    else
      # TODO
      # create a new user and send an invitation link to reset password
    end
    # TODO
    # send a notification to the user
  end
end
