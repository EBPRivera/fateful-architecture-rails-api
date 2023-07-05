class User < ApplicationRecord
  has_secure_password

  has_many :characters, dependent: :destroy

  validates :username, presence: true
  validates :password_digest, presence: true
end
