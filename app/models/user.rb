class User < ApplicationRecord
  has_secure_password
  has_many :user_issues
  has_many :issues, through: :user_issues
  has_many :user_bills
  has_many :bills, through: :user_bills
  validates :username, :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 5 }, on: :create

  def self.from_oauth(info)
    user = find_by(uid: info[:uid]) || User.new
    user.attributes = {
      uid: info[:uid],
      username: info[:info][:name],
      email: info[:info][:email],
      password: info[:uid],
      oauth_token: info[:credentials][:token],
      oauth_expire: info[:credentials][:expires_at],
      image: info[:info][:image]
    }
    user.save
    user
  end
end
