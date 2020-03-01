class SeasonsController < ApplicationController
    
    def index
        seasons = Season.all.order(:created_at)#.as_json(include: :episodes)
        render json: seasons
    end
end
