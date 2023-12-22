class AddProcessDayToWarehouse < ActiveRecord::Migration[7.0]
  def change
    add_column :warehouses, :process_day, :integer
  end
end
