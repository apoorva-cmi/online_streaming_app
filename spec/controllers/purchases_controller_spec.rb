require 'rails_helper'

RSpec.describe PurchasesController do  
    
  describe "POST #create" do

    it "returns http failure without required params" do
      expect{ post(:create, {}) }.to raise_error ActionController::ParameterMissing
      expect{ post(:create, params: { purchase: {}}) }.to raise_error ActionController::ParameterMissing
      expect{ post(:create, params: { purchase: {user_email: "sas@dad.com"}}) }.to raise_error ActionController::ParameterMissing
    end  
    
    it "JSON body response returns error when no user present" do
      movie = FactoryBot.create(:movie)
      purchase_option = FactoryBot.create(:purchase_option)
      post(:create, params: { purchase: {user_email: "sas@dad.com", content_id: movie.id, content_type: "Movie", video_quality: purchase_option.video_quality}})
      json_response = JSON.parse(response.body)
      expect(response.status).to eq(404)
      expect(json_response["response"]).to eq("User not present. Please SignUp or Login.")
    end

    it "JSON body response returns error when no purchase_option present for the movie" do
      user = FactoryBot.create(:user)
      movie = FactoryBot.create(:movie)
      post(:create, params: { purchase: {user_email: user.email, content_id: movie.id, content_type: "Movie", video_quality: "HD"}})
      json_response = JSON.parse(response.body)
      expect(response.status).to eq(404)
      expect(json_response["response"]).to eq("No purchase option found for the Movie.")
    end

    it "JSON body response returns error when no purchase_option present for the season" do
      user = FactoryBot.create(:user)
      season = FactoryBot.create(:season)
      post(:create, params: { purchase: {user_email: user.email, content_id: season.id, content_type: "Season", video_quality: "HD"}})
      json_response = JSON.parse(response.body)
      expect(response.status).to eq(404)
      expect(json_response["response"]).to eq("No purchase option found for the Season.")
    end

    it "JSON body response returns success when with appropriate params" do
      user = FactoryBot.create(:user)
      season = FactoryBot.create(:season)
      purchase_option = FactoryBot.create(:purchase_option, purchase_optionable: season)
      post(:create, params: { purchase: {user_email: user.email, content_id: season.id, content_type: "Season", video_quality: purchase_option.video_quality}})
      json_response = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(json_response["response"].keys).to eq(["id", "user_id", "content_id", "content_type", "price", "video_quality", "start_date", "end_date", "created_at", "updated_at", "purchase_option_id"])
    end

    it "JSON body response returns failure when same content is alive or not expired" do
        user = FactoryBot.create(:user)
        season = FactoryBot.create(:season)
        purchase_option = FactoryBot.create(:purchase_option, purchase_optionable: season)
        post(:create, params: { purchase: {user_email: user.email, content_id: season.id, content_type: "Season", video_quality: purchase_option.video_quality}})
        # Attempt to purchase the same content again
        post(:create, params: { purchase: {user_email: user.email, content_id: season.id, content_type: "Season", video_quality: purchase_option.video_quality}})
        json_response = JSON.parse(response.body)
        expect(response.status).to eq(400)
        expect(json_response["response"]).to eq("The content is already purchased. You can view it in 2 days")
      end
  end
end