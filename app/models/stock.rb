class Stock < ApplicationRecord
  has_many :investments
  has_many :users, through: :investments

  validates :ticker, uniqueness: true
end
