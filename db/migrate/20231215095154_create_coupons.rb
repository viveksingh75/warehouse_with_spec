class CreateCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :coupons do |t|
      t.string :name
      t.string :coupon_code
      t.integer :discount
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
