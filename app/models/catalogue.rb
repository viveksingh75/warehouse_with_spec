class Catalogue < ApplicationRecord
  #has_many :obtain_coupons

  def self.ransackable_attributes(auth_object = nil)
    %w[id name created_at updated_at]
  end
end
