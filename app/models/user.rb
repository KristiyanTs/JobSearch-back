class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JWTBlacklist
  

  belongs_to :group, optional: true
  belongs_to :parent, class_name: 'User', foreign_key: 'parent_id', optional: true
  has_many :children, class_name: 'User'
  has_many :lessons
  has_many :attendances
  
  def attributes
    { id: id, email: email, admin: admin, name: name, role: role }
  end

  enum role: [:student, :guardian, :teacher]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :student
  end
end
