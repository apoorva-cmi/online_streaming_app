class PurchasesController < ApplicationController
    before_action :create_params, only: [:create]
    before_action :set_user, only: [:create]
    
    def index
        purchases = Purchase.all.order(:created_at)
        render json: {
            status: :ok,
            response: purchases
        }, status: :ok
    end

    def create
        same_alive_purchases = @user.purchases.where(content_id: @params["content_id"], content_type: @params["content_type"]).alive
        if same_alive_purchases.any?
            render json: {
                status: :bad_request,
                response: "The content is already purchased. You can view it in #{same_alive_purchases.last.remaining_time_to_watch_in_days}"
            }, status: :bad_request
        else
            purchase_option = find_purchase_option(@params)
            if purchase_option.nil?
                render json: {
                    status: :not_found,
                    response: "No purchase option found for the #{@params["content_type"]}."
                }, status: :not_found
            else
                purchase = @user.purchases.new
                purchase.content_id = @params["content_id"]
                purchase.content_type = @params["content_type"]
                purchase.purchase_option = purchase_option
                purchase.price = purchase_option.price
                purchase.video_quality = purchase_option.video_quality
                purchase.start_date = Date.today
                purchase.end_date = Date.today + 2.days
                purchase.save
                render json: {
                    status: :ok,
                    response: purchase
                }, status: :ok
            end
        end
    end

    private

    def set_user
        @user = User.find_by(email: @params["user_email"])
        render json: {
            status: :not_found,
            response: "User not present. Please SignUp or Login."
        }, status: :not_found if @user.nil?
    end

    def create_params
        params.require(:purchase).require([:user_email, :content_id, :content_type, :video_quality])
        params.require(:purchase).permit(:user_email, :content_id, :content_type, :video_quality)
        @params = params["purchase"]
    end

    def find_purchase_option(params)
        PurchaseOption.where(video_quality: params["video_quality"], purchase_optionable_id: params["content_id"], purchase_optionable_type: "Content")&.last
    end
end
