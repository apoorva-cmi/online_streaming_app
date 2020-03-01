require 'rails_helper'

RSpec.describe MoviesController do  
    
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
        FactoryBot.create(:movie)
        get :index
        json_response = JSON.parse(response.body)
        expect(json_response.first.keys).to eq(["id", "title", "plot", "type", "created_at", "updated_at"])
    end

    it "Movies should be ordered by creation" do
        FactoryBot.create(:movie)
        FactoryBot.create(:movie, created_at: Date.yesterday)
        get :index
        json_response = JSON.parse(response.body)
        expect(json_response.map{|x| x["created_at"]}).to eq(json_response.map{|x| x["created_at"]}.sort)
    end
  end
end