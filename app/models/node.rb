class Node < ApplicationRecord
  belongs_to :root, class_name: "Node", optional: true
  belongs_to :parent, class_name: "Node", optional: true
  belongs_to :user, optional: true
  belongs_to :assigned, class_name: "User", optional: true
  belongs_to :reporter, class_name: "User", optional: true
  belongs_to :status, optional: true
  belongs_to :category, optional: true

  has_many :nodes, foreign_key: :root_id
  has_many :children, class_name: "Node", foreign_key: :parent_id
  has_many :favorites, dependent: :delete_all
  has_many :statuses, dependent: :delete_all
  accepts_nested_attributes_for :statuses
  has_many :categories, dependent: :delete_all
  accepts_nested_attributes_for :categories


  #TODO Nodes could have requirements model which could serve for testing purposes
end
