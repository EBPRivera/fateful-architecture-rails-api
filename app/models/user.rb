class User < ApplicationRecord
  has_secure_password

  has_many :characters, dependent: :destroy

  validates_presence_of :username, :password, :password_confirmation,
                        on: :create
  validates :username, uniqueness: true, format: { with: /\A\w+\z/,
                                                   message: "Invalid username" }
  validates :password, confirmation: true,
                       format:
                        { without: /\s/,
                          message: "Password must not contain white spaces" }
end
