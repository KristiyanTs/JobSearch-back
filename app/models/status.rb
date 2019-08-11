class Status < ApplicationRecord
  belongs_to :node

  has_many :nodes
end
