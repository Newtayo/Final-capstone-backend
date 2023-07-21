class User < ApplicationRecord
  has_many :reservations
  has_many :laptops, through: :reservations
  validates :username, length: { in: 6..20 }
  validates :username, uniqueness: true
end
