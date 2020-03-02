require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before(:each) do
    @purchase = FactoryBot.create(:purchase)
  end

  describe 'Purchase' do
    it 'should be valid' do
      expect(@purchase).to be_valid
    end
  end

  describe 'user' do
    it 'should be present' do
      @purchase.user = nil
      expect(@purchase).to be_invalid
    end
  end

  describe 'content' do
    it 'should be present' do
      @purchase.content = nil
      expect(@purchase).to be_invalid
    end
  end

  describe 'purchase_option' do
    it 'should be present' do
      @purchase.purchase_option = nil
      expect(@purchase).to be_invalid
    end
  end

  describe 'start_date' do
    it 'should be present' do
      @purchase.start_date = nil
      expect(@purchase).to be_invalid
    end
  end

  describe 'end_date' do
    it 'should be 2 days from start_date' do
      expect(@purchase.end_date).to eq(@purchase.start_date + 2.days)
    end
  end
end
