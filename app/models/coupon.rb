class Coupon < ApplicationRecord
  #has_many :obtain_coupons
  belongs_to :admin_user, optional: true
  def self.ransackable_attributes(auth_object = nil)
    ["admin_user_id", "coupon_code", "created_at", "discount", "end_date", "id", "name", "start_date", "updated_at"]
  end
end
