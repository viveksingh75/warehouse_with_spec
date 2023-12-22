class ObtainCatalouge < ApplicationRecord
  belongs_to :account
  belongs_to :catalogue
  has_many :obtain_coupons
end
