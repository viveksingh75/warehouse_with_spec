
require 'rails_helper'

RSpec.describe Coupon, type: :model do
  describe 'associations' do
    it { should have_many(:obtain_coupons) }
    it { should belong_to(:admin_user).optional }
  end
  describe 'ransackable_attributes' do
    it 'includes attribuets' do
      ransackable_attributes = Coupon.ransackable_attributes
      expected_attributes = %w[admin_user_id coupon_code created_at discount end_date id name start_date updated_at]

      expect(ransackable_attributes).to match_array(expected_attributes)
    end
  end
end
