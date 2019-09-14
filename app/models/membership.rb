class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :node
  belongs_to :role

  def attach_user_info
    as_json.merge(
      user: user
    )
  end
end
