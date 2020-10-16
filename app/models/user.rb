class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews
  validates :name, :email, :bio, presence: true
  validates :email, uniqueness: true

end
