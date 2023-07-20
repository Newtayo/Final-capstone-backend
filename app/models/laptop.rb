class Laptop < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations

  validates :name, presence: true
  validates :description, length: { in: 20..120 }
  validates :photo_url, presence: true
  validates :model_year, presence: true
  validates :price, presence: true
  validates :rom_size, presence: true
  validates :ram_size, presence: true
end
