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
    
    it "JSON body response returns success with user's library" do
      user = FactoryBot.create(:user)
      purchase = FactoryBot.create(:purchase, user: user)
      get "library", params: { id: user.id }
      json_response = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(json_response.keys).to eq(["id", "email", "library"])
    end

    it "JSON response has right contents in the library" do
      user = FactoryBot.create(:user)
      purchase = FactoryBot.create(:purchase, user: user)
      get "library", params: { id: user.id }
      json_response = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(json_response["library"].first.keys).to eq(["id", "content_type", "price", "video_quality", "start_date", "end_date", "created_at", "updated_at", "purchase_option_id", "remaining_time_to_watch_in_days"])
    end
  end
end