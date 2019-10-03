class User < ApplicationRecord
  has_many :investments
  # has_many :stocks, through: :investments

  validates :email, uniqueness: true
  has_secure_password
end
