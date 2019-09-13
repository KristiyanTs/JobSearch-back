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

  # keep the invitation so that prooject manager knows it was declined 
  # and could later delete the declined iinvitation
  # set its 'declined' to true
  def decline
    update(declined: true)
  end

  # destroy the invitation and create a membership within the node
  # & notify all members(except current user) that a new member joined
  def accept
    user.memberships.create(node_id: node_id, role_id: role_id)
    self.destroy
    # TODO
    # notify team that the new member joined
  end

  # TODO: make it a/an depending on the first letter of 'role'
  def attach_label
    project = self.node.root.title
    role = self.role.title
    as_json.merge(
      label: "Join #{project} as a #{role}."
    )
  end
end
