class MoviesController < ApplicationController
    
    def index
        movies = Movie.all.order(:created_at)
        render json: movies
    end
end
