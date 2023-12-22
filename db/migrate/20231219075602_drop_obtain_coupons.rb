class DropObtainCoupons < ActiveRecord::Migration[7.0]
  def change
    drop_table :obtain_coupons
  end
end
