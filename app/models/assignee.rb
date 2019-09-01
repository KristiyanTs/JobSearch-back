class Assignee < ApplicationRecord
  belongs_to :user
  belongs_to :node
end
