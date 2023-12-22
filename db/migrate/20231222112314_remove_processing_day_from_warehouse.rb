class RemoveProcessingDayFromWarehouse < ActiveRecord::Migration[7.0]
  def change
    remove_column :warehouses, :processing_day, :integer
  end
end
