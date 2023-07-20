class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :laptop

  validates :user_id, presence: true
  validates :laptop_id, presence: true
  validates :date, presence: true
  validates :city, presence: true
  validates :hour, presence: true
  validates :laptop_id, uniqueness: { scope: %i[date hour] }
end
