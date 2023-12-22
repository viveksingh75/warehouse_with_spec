class ObtainCoupon < ApplicationRecord
  belongs_to :account
  belongs_to :obtain_catalogue
  belongs_to :coupon
end
