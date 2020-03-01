require 'rails_helper'

RSpec.describe Season, type: :model do
  before(:each) do
    @season = FactoryBot.build(:season)
  end

  describe 'Season' do
    it 'should be valid' do
      expect(@season).to be_valid
    end
  end

  describe 'title' do
    it 'should be present' do
      @season.title = nil
      expect(@season).to be_invalid
    end
  end

  describe 'plot' do
    it 'should be present' do
      @season.plot = nil
      expect(@season).to be_invalid
    end
  end

  describe 'number' do
    it 'should be present' do
        @season.number = nil
        expect(@season).to be_invalid
    end

    it 'should be not be present' do
      @season.number = 12
      expect(@season).to be_valid
    end
  end
end
