class Invitation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :node
end
