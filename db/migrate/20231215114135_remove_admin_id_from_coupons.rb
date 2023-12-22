class RemoveAdminIdFromCoupons < ActiveRecord::Migration[7.0]
  def change
    remove_column :coupons, :admin_id
  end
end
