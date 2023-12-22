class CreateWarehouses < ActiveRecord::Migration[7.0]
  def change
    create_table :warehouses do |t|
      t.string :warehouse_name
      t.integer :processing_day
      t.string :address
      t.integer :contect

      t.timestamps
    end
  end
end
