class Api::V1::WarehousesController < ApplicationController
    before_action :authenticate_account!
    before_action :check_user_type, only: [:index, :create, :update, :destroy]
    before_action :set_warehouse, only: [:update, :destroy]

    def index
      render json: WarehouseSerializer.new(Warehouse.all).serializer_class, status: :ok
    end
  
    def create
      @warehouse = Warehouse.new(warehouse_params)
      if @warehouse.save
        render json: WarehouseSerializer.new(@warehouse).serializer_class, status: :created
      else
        render json: { errors: @warehouse.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      if @warehouse.update(warehouse_params)
        render json: WarehouseSerializer.new(@warehouse).serializer_class, status: :ok
      else
        render json: { errors: @warehouse.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      @warehouse.destroy
      head :no_content
    end
  
    private
  
    def set_warehouse
      @warehouse = Warehouse.find(params[:id])
    end

    def warehouse_params
        params.require(:warehouse).permit(:warehouse_name, :process_day, :address, :contect)
    end
    def check_user_type
        unless current_account && current_account.user_type == "seller"
          render json: { error: "Unauthorized access" }, status: :unauthorized
        end
    end
end
