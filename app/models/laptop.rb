class Laptop < ApplicationRecord
  has_many :users, through: :reservations
  has_many :reservations, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :image_url, presence: true
  validates :price, presence: true
  validates :model_year, presence: true
  validates :rom_size, presence: true
  validates :ram_size, presence: true
end
