class User < ApplicationRecord
  devise :database_authenticatable, 
    :registerable,
    :recoverable, 
    :rememberable, 
    :validatable, 
    :confirmable,
    :omniauthable, :jwt_authenticatable, omniauth_providers: 
    [:google_oauth2], jwt_revocation_strategy: JWTBlacklist

  has_one_attached :image
  
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
    { id: id, email: email, admin: admin, name: name }
  end
end
