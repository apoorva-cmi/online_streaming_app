require 'rails_helper'

RSpec.describe Episode, type: :model do
  before(:each) do
    @episode = FactoryBot.build(:episode)
  end

  describe 'episode' do
    it 'should be valid' do
      expect(@episode).to be_valid
    end
  end

  describe 'title' do
    it 'should be present' do
      @episode.title = nil
      expect(@episode).to be_invalid
    end
  end

  describe 'plot' do
    it 'should be present' do
      @episode.plot = nil
      expect(@episode).to be_invalid
    end
  end

  describe 'number' do
    it 'should be present' do
        @episode.number = nil
        expect(@episode).to be_invalid
    end

    it 'should be not be present' do
      @episode.number = 12
      expect(@episode).to be_valid
    end
  end

  describe 'season' do
    it 'should be present' do
        @episode.season = nil
        expect(@episode).to be_invalid
    end
  end
end
