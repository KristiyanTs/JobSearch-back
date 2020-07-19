class User < ApplicationRecord
  devise :database_authenticatable, 
    :registerable,
    :recoverable, 
    :rememberable, 
    :validatable, 
    :confirmable,
    :omniauthable, :jwt_authenticatable, omniauth_providers: 
    [:google_oauth2], jwt_revocation_strategy: JWTBlacklist

  belongs_to :parent, class_name: 'User', foreign_key: 'parent_id', optional: true
  
  has_many :children, class_name: 'User', foreign_key: 'parent_id'
  has_many :lessons
  has_many :memberships, dependent: :delete_all
  has_many :groups, dependent: :nullify
  has_many :groups, through: :memberships
  has_many :payments, as: :recipient, dependent: :nullify
  has_many :payments, as: :payer, dependent: :nullify

  has_one_attached :image

  enum role: [:student, :guardian, :teacher]
  after_initialize :set_default_role, :if => :new_record?
  
  def self.from_omniauth(token)
    user = User.find_by(uid: token['uid'])
    user = User.find_by(email: token.info['email']) unless user
    unless user
      password = Devise.friendly_token[0, 20]
      user = User.new(
        name: token.info['name'],
        provider: token['provider'],
        uid: token['uid'],
        email: token.info['email'] || SecureRandom.hex(5) + "@changemeplease.com",
        confirmed_at: Date.current,
        password: password,
        password_confirmation: password
      )
      user.save!
    end
    user
  end

  def attributes
    { id: id, email: email, admin: admin, name: name, role: role }
  end

  def set_default_role
    self.role ||= :student
  end

  def attach_info
    if student?
      as_json.merge(
        memberships: memberships.map(&:attach_payments), 
        groups: groups
      )
    elsif guardian?
      as_json.merge(
        children: children
      )
    elsif teacher?
      as_json.merge(
        groups: groups,
        balance: balance,
        credit: credit
      )
    end
  end
end
