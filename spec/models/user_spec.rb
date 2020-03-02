require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = FactoryBot.build(:user)
  end

  describe 'User' do
    it 'should be valid' do
      expect(@user).to be_valid
    end
  end

  describe 'email' do
    it 'should be present' do
      @user.email = nil
      expect(@user).to be_invalid
    end

    it 'should be of proper format' do
      @user.email = "ab.com"
      expect(@user).to be_invalid
      expect(@user.errors.messages[:email]).to eq(["is invalid"])
    end
  end
end
