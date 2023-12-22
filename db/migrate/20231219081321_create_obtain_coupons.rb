class CreateObtainCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :obtain_coupons do |t|
      t.references :account, null: false, foreign_key: true
      t.references :obtain_catalogue, null: false, foreign_key: true
      t.references :coupon, null: false, foreign_key: true

      t.timestamps
    end
  end
end
