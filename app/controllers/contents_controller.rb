class ContentsController < ApplicationController
    
    def index
        contents = Content.where(type: ["Movie", "Season"]).order(:created_at)
        render json: contents
    end
end
