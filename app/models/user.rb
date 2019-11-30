class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JWTBlacklist
  
  belongs_to :parent, class_name: 'User', foreign_key: 'parent_id', optional: true
  has_many :children, class_name: 'User', foreign_key: 'parent_id'
  has_many :lessons
  has_many :attendances, dependent: :delete_all
  has_many :memberships, dependent: :delete_all
  has_many :groups, dependent: :nullify
  has_many :groups, through: :memberships

  enum role: [:student, :guardian, :teacher]
  after_initialize :set_default_role, :if => :new_record?
  
  def attributes
    { id: id, email: email, admin: admin, name: name, role: role }
  end

  def set_default_role
    self.role ||= :student
  end

  def attach_info
    if student?
      as_json.merge(
        groups: groups
      )
    elsif guardian?
      as_json.merge(
        children: children
      )
    elsif teacher?
      as_json.merge(
        groups: groups
      )
    end
  end
end
