require 'rails_helper'

RSpec.describe Laptop, type: :model do
  describe 'test laptop validation' do
    let(:laptop) {Laptop.create(name: "DELL Latitude 7280", description: "The Dell Latitude 7280 runs smoothly and cranks through basic tasks just fine. On the other hand, it is super tough.", photo_url: "My photo", price: 440000, model_year: "2021", rom_size: "500gb", ram_size: "16gb")}
    
    it 'should have name' do
        laptop.name = nil
        expect(laptop).not_to be_valid
    end

    it 'should have name' do
        laptop.description = nil
        expect(laptop).not_to be_valid
    end

    it 'should have name' do
        laptop.photo_url = nil
        expect(laptop).not_to be_valid
    end

    it 'should have name' do
        laptop.price = nil
        expect(laptop).not_to be_valid
    end

    it 'should have name' do
        laptop.model_year = nil
        expect(laptop).not_to be_valid
    end

    it 'should have name' do
        laptop.rom_size = nil
        expect(laptop).not_to be_valid
    end

    it 'should have name' do
        laptop.ram_size = nil
        expect(laptop).not_to be_valid
    end

  end

  describe 'test association' do
    it 'has many reservations' do
        expect(Laptop.reflect_on_association(:reservations).macro).to eq(:has_many)
    end

    it 'has many users' do
        expect(Laptop.reflect_on_association(:users).macro).to eq(:has_many)
    end
  end
end
