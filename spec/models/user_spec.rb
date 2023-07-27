require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'test user validation' do
    let(:user) { User.create(username: 'Queenter') }

    it 'should have a username' do
      user.username = nil
      expect(user).not_to be_valid
    end

    it 'should have a username with length between 6 and 20 characters' do
      user.username = 'Ann'
      expect(user).not_to be_valid
      user.username = 'A' * 21
      expect(user).not_to be_valid
    end

    it 'should have a unique username' do
      user1 = User.create(username: 'Queenter')
      user2 = User.create(username: 'Queenter')
      expect(user2).not_to be_valid
    end
  end
end
