require 'rails_helper'

RSpec.describe Admin::AdminStatusesController, type: :controller do
  render_views
  let(:admin_user) { create(:admin_user) }
  let!(:admin_status) { create(:admin_status) }
  let(:valid_attributes) do
    {
      name: Faker::Name.unique.name
    }
  end

  before do
    sign_in admin_user
  end

  describe "POST #create order status" do
    context "order status with valid attributes" do
      it "creates a new order status record" do
        post :create, params: { admin_status: valid_attributes }
       expect(response).to redirect_to(admin_admin_status_path(AdminStatus.last))
        expect(response).to have_http_status(302)
      end
      it "creates a new order status record" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "UPDATE#order status" do
    it 'should update order status' do
      patch :update, params: {id: admin_status.id, admin_status: valid_attributes }
      expect(response).to have_http_status(302)
    end
  end

  describe "DELETE #order status" do
    it 'should delete order status' do
      delete :destroy, params: { id: admin_status.id }
      expect(response).to have_http_status(302)
    end
  end

  describe "INDEX#order status" do
    it 'should index order statuses' do
      get :index
      expect(response).to have_http_status :success
    end
  end

  describe "SHOW#Coupon" do
    it 'should show order status' do
      get :show, params: {id: admin_status.id}
      expect(response).to have_http_status :success
    end
  end
end