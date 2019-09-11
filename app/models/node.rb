class Node < ApplicationRecord
  has_ancestry
  
  belongs_to :reporter, class_name: "User", optional: true
  belongs_to :status, optional: true
  belongs_to :category, optional: true

  has_many :favorites, dependent: :delete_all
  has_many :statuses, dependent: :delete_all
  has_many :categories, dependent: :delete_all
  has_many :invitations, dependent: :delete_all
  has_many :memberships, dependent: :delete_all
  has_many :member, through: :memberships
  has_many :roles, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :assignees, dependent: :delete_all

  def attributes
    { 
      id: id, 
      title: title, 
      reporter: reporter,
      category_id: category_id,
      status_id: status_id,
      roles: roles,
      description: description,
      created_at: created_at,
      updated_at: updated_at,
      ancestry: ancestry,
      root_id: root.id,
    }
  end

  def attach_ancestry_info
    as_json.merge(
      children: children
    )
  end
end
