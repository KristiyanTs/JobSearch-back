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
  accepts_nested_attributes_for :assignees

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
      root_id: root.id
    }
  end

  def attach *args
    params = { }
    params["children"] = children.map(&:attach.with(:assignees)) if args.include? :children
    params["assignees"] = assignees.as_json if args.include? :assignees
    as_json.merge(params)
  end
end
