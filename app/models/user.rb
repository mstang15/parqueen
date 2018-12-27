class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :google_token, presence: true
  validates :uid, presence: true
  validates :name, presence: true

  has_many :parkings

  def self.update_or_create(auth)
    user = User.find_by(uid: auth[:uid]) || User.new
    user.attributes = {
      uid: auth[:uid],
      email: auth[:info][:email],
      name: auth[:info][:name],
      google_token: auth[:credentials][:token]
    }
    user.save!
    user
  end
end
