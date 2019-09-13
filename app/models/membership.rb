class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :node
  belongs_to :role
end
