require 'rails_helper'

RSpec.describe UsersController do  
    
  describe "GET #library" do

    it "returns http failure without a User" do
      get "library", params: { id: '' }
      expect(response).to have_http_status(:not_found)
      json_response = JSON.parse(response.body)
      expect(json_response["response"]).to eq("User not present. Please SignUp or Login.")
    end   

    it "returns http success with a valid User" do
      user = FactoryBot.create(:user)
      get "library", params: { id: user.id }
      expect(response).to have_http_status(:success)
    end    
    
    # it "JSON body response contains no values" do
    #   get :index
    #   json_response = JSON.parse(response.body)
    #   expect(json_response.empty?).to be_truthy
    # end

    # it "JSON body response should contain movie values" do
    #     FactoryBot.create(:movie)
    #     get :index
    #     json_response = JSON.parse(response.body)
    #     expect(json_response.first.keys).to eq(["id", "title", "plot", "type", "created_at", "updated_at"])
    # end

    # it "JSON body response should contain season values" do
    #     FactoryBot.create(:season)
    #     get :index
    #     json_response = JSON.parse(response.body)
    #     expect(json_response.first.keys).to eq(["id", "title", "plot", "number", "type", "created_at", "updated_at", "episodes"])
    # end

    # it 'JSON response should contain only movie and season values' do
    #     FactoryBot.create(:movie)
    #     FactoryBot.create(:season)
    #     get :index
    #     json_response = JSON.parse(response.body)
    #     expect(json_response.map{|x| x["type"]}.sort).to eq(["Movie", "Season"])
    # end

    # it "Contents should be ordered by creation" do
    #     FactoryBot.create(:season)
    #     FactoryBot.create(:movie, created_at: Date.yesterday)
    #     get :index
    #     json_response = JSON.parse(response.body)
    #     expect(json_response.map{|x| x["created_at"]}).to eq(json_response.map{|x| x["created_at"]}.sort)
    # end
  end
end