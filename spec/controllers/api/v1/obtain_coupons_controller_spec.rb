require 'rails_helper'

RSpec.describe Api::V1::ObtainCouponsController, type: :controller do
  let(:account) { create(:account) }
  let(:coupon) { create(:coupon) }
    let(:catalogue) { create(:catalogue) }
    let(:obtain_coupon) { create(:obtain_coupon) }
  before do
    sign_in account
  end
  describe 'GET#index' do
      it 'returns a list of all coupons and coupons obtained by the account' do
        get :index
        expect(response).to have_http_status(:ok) 
      end
  end
  describe 'GET#new' do
    it 'return the new obtain_coupon' do
      get :new 
      expect(response).to have_http_status(:ok) 
    end  
  end
  describe 'POST#create' do
    it 'returnthe create obtain_coupon' do
      post :create, params: {
        obtain_coupon: {
          coupon_id: coupon.id,
          catalogue_id: catalogue.id,
          account_id: account.id
        }
      }
      expect(response).to have_http_status(:created) # Change this line to expect :no_content (204)
    end
  end
  describe "GET#destroy" do
    it 'should destroy the obtains' do
      get :destroy, params: { id: obtain_coupon.id }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(ObtainCoupon.find_by(id: obtain_coupon.id)).to be_nil
    end
  end
end