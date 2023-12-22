class ObtainCouponsController < ApplicationController
    before_action :authenticate_account!
    before_action :check_user_type, only: [:index, :new, :create, :destroy]
    def index 
        @coupons= Coupon.all
         @coupons_obtained_by_account = current_account.obtain_coupons
    end   
    def new 
        @obtain_coupon = ObtainCouponAssociation.new
    end
    def create
      @obtain_coupon = ObtainCouponAssociation.new(obtain_coupon_params)
      if @obtain_coupon.save
        redirect_to obtain_coupons_path, notice: 'ObtainCoupon was successfully created.'
      else
        render :new
      end
    end
    def destroy
      @obtain_coupon = ObtainCouponAssociation.find(params[:id])
      @obtain_coupon.destroy
      redirect_to obtain_coupons_url,status: :see_other
    end
      private
      def obtain_coupon_params
        params.require(:obtain_coupon_association).permit(:coupon_id,:catalogue_id, :account_id)
      end
      def check_user_type
        if current_account && current_account.user_type == "seller"
        else
          redirect_to root_path, notice: 'Access denied.'
      end
    end  
end
