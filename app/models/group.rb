class Group < ApplicationRecord
  enum lesson: [:individual, :collective]
  has_many :memberships
end
