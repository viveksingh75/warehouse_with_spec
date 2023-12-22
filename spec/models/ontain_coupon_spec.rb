
require 'rails_helper'

RSpec.describe ObtainCoupon, type: :model do
  describe 'associations' do
    it { should belong_to(:coupon).optional }
    it { should belong_to(:account) }
    it { should belong_to(:catalogue) }
  end
end
