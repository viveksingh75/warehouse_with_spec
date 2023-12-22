class Api::V1::OrderStatusesController < ApplicationController
    before_action :set_admin_status, only: [:show]

    def index
      render json: AdminStatusSerializer.new(AdminStatus.all).serializable_hash, status: :ok
    end

    def show
      render json: AdminStatusSerializer.new(@admin_status).serializable_hash, status: :ok
    end

    private

    def set_admin_status
      @admin_status = AdminStatus.find_by(id: params[:id])
      if @admin_status.nil?
        render json: {
            message: "admin status with id #{params[:id]} doesn't exists"
          }, status: :not_found
      end
    end
  end
end
