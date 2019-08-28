class Node < ApplicationRecord
  belongs_to :root, class_name: "Node", optional: true
  belongs_to :parent, class_name: "Node", optional: true
  belongs_to :assigned, class_name: "User", optional: true
  belongs_to :reporter, class_name: "User", optional: true
  belongs_to :status, optional: true
  belongs_to :category, optional: true

  has_many :nodes, foreign_key: :root_id
  has_many :children, class_name: "Node", foreign_key: :parent_id
  has_many :favorites, dependent: :delete_all
  has_many :statuses, dependent: :delete_all
  has_many :categories, dependent: :delete_all
  has_many :invitations, dependent: :delete_all
  has_many :memberships, dependent: :delete_all
  has_many :member, through: :memberships
  has_many :roles, dependent: :delete_all

  def attributes
    { 
      id: id, 
      title: title, 
      reporter: reporter, 
      assigned: assigned, 
      category_id: category_id,
      status_id: status_id,
      roles: roles,
      parent_id: parent_id
      # avatar: (rails_blob_url(avatar) if avatar.attached?)
    }
  end

  def attach_node_info
    as_json.merge(
      root_id: root_id,
      nodes: children
    )
  end
end
