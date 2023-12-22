class WarehouseSerializer < ActiveModel::Serializer
  attributes :id, :warehouse_name, :process_day, :address, :contect
end
