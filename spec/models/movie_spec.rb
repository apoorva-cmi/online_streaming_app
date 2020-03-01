require 'rails_helper'

RSpec.describe Movie, type: :model do
  before(:each) do
    @movie = FactoryBot.build(:movie)
  end

  describe 'Movie' do
    it 'should be valid' do
      expect(@movie).to be_valid
    end
  end

  describe 'title' do
    it 'should be present' do
      @movie.title = nil
      expect(@movie).to be_invalid
    end
  end

  describe 'plot' do
    it 'should be present' do
      @movie.plot = nil
      expect(@movie).to be_invalid
    end
  end

  describe 'number' do
    it 'should be not be present' do
      @movie.number = 12
      expect(@movie).to be_invalid
      expect(@movie.errors.messages[:number].include?("must be blank")).to be_truthy
    end

    it 'should be nil' do
      @movie.number = nil
      expect(@movie).to be_valid
    end
  end
end
