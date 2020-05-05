class Pricing < ApplicationRecord
  has_many :groups
  has_many :employees, class_name: 'User'
end
