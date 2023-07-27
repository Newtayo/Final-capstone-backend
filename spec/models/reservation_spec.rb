require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'test reservation validation' do
    let(:user) { User.create(username: 'JohnDoe') }
    let(:laptop) { Laptop.create(name: "DELL Latitude 7280", description: "The Dell Latitude 7280 runs smoothly and cranks through basic tasks just fine. On the other hand, it is super tough.", photo_url: "My photo", price: 440000, model_year: "2021", rom_size: "500gb", ram_size: "16gb") }

    before do
      Reservation.create(user: user, laptop: laptop, date: Date.today, city: "New York", hour: "09:00 AM")
    end

    it 'should belong to a user' do
      reservation = Reservation.new(user: nil, laptop: laptop, date: Date.today, city: "New York", hour: "09:00 AM")
      expect(reservation).not_to be_valid
    end

    it 'should belong to a laptop' do
      reservation = Reservation.new(user: user, laptop: nil, date: Date.today, city: "New York", hour: "09:00 AM")
      expect(reservation).not_to be_valid
    end

    it 'should have a date' do
      reservation = Reservation.new(user: user, laptop: laptop, date: nil, city: "New York", hour: "09:00 AM")
      expect(reservation).not_to be_valid
    end

    it 'should have a city' do
      reservation = Reservation.new(user: user, laptop: laptop, date: Date.today, city: nil, hour: "09:00 AM")
      expect(reservation).not_to be_valid
    end

    it 'should have an hour' do
      reservation = Reservation.new(user: user, laptop: laptop, date: Date.today, city: "New York", hour: nil)
      expect(reservation).not_to be_valid
    end

    it 'should be unique for a specific laptop on a specific date and hour' do
      # Try to create another reservation with the same laptop, date, and hour
      duplicate_reservation = Reservation.new(user: user, laptop: laptop, date: Date.today, city: "New York", hour: "09:00 AM")
      expect(duplicate_reservation).not_to be_valid
    end
  end

  describe 'test associations' do
    it 'belongs to a user' do
      expect(Reservation.reflect_on_association(:user).macro).to eq(:belongs_to)
    end

    it 'belongs to a laptop' do
      expect(Reservation.reflect_on_association(:laptop).macro).to eq(:belongs_to)
    end
  end
end
