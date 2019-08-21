class Role < ApplicationRecord
  belongs_to :node
  
  has_many :memberships
  has_many :permissions, dependent: :delete_all
end
