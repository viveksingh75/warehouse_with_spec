class Api::V1::ObtainCouponsController < ApplicationController
    before_action :authenticate_account!
    before_action :check_user_type, only: [:index, :new, :create, :destroy]
    def index 
      coupons= Coupon.all
      coupons_obtained_by_account = current_account.obtain_coupons
      response_data = {
              coupons: coupons,
              coupons_obtained_by_account: coupons_obtained_by_account
        }
      render json: response_data, status: :ok
    end   
    def new 
      obtain_coupon = ObtainCoupon.new
      render json: obtain_coupon, status: :ok
    end
    def create
      @obtain_coupon = ObtainCoupon.new(obtain_coupon_params)
      if @obtain_coupon.save
        render json: @obtain_coupon, status: :created
      else
      end
    end
    def destroy
      @obtain_coupon = ObtainCoupon.find(params[:id])
      @obtain_coupon.destroy
      render json: @obtain_coupon, status: :unprocessable_entity
    end
      private
      def obtain_coupon_params
        params.require(:obtain_coupon).permit(:coupon_id,:catalogue_id, :account_id)
      end
      def check_user_type
        if current_account && current_account.user_type == "seller"
        end
      end  
end

