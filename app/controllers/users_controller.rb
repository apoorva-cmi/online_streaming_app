class UsersController < ApplicationController

    before_action :set_user, only: [:library]
    
    def library
        render json: @user
    end

    private

    def set_user
        @user = User.find_by(id: params[:id].to_i)

        render json: {
            status: 404,
            response: "User not present. Please SignUp or Login."
        }, status: :not_found if @user.nil?
    end
end
