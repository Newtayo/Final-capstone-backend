class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :laptop

  validates :city, presence: true
  validates :duration_of_hire, presence: true
  validates :date_of_reservation, presence: true
end
