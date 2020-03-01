require 'rails_helper'

RSpec.describe SeasonsController do  
    
  describe "GET #index" do
    before do
      get :index
    end    
    
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end    
    
    it "JSON body response contains no values" do
      json_response = JSON.parse(response.body)
      expect(json_response.empty?).to be_truthy
    end

    it "JSON body response should contain values" do
        FactoryBot.create(:season)
        get :index
        json_response = JSON.parse(response.body)
        expect(json_response.first.keys).to eq(["id", "title", "plot", "number", "type", "created_at", "updated_at", "episodes"])
    end

    it "Seasons should be ordered by creation" do
        FactoryBot.create(:season)
        FactoryBot.create(:season, created_at: Date.yesterday)
        get :index
        json_response = JSON.parse(response.body)
        expect(json_response.map{|x| x["created_at"]}).to eq(json_response.map{|x| x["created_at"]}.sort)
    end

    it 'Episodes should be ordered by number' do
        season = FactoryBot.create(:season)
        FactoryBot.create(:episode, season: season, number: 2)
        FactoryBot.create(:episode, season: season)
        get :index
        json_response = JSON.parse(response.body)
        expect(json_response.first["episodes"].map{|x| x["number"]}).to eq(json_response.first["episodes"].map{|x| x["number"]}.sort)
    end
  end
end