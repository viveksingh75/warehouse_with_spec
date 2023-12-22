require 'rails_helper'

RSpec.describe Api::V1::WarehousesController, type: :controller do
    let(:current_account) { create(:account) }
    let(:valid_attributes) { attributes_for(:warehouse) }
    let(:invalid_attributes) {
    { warehouse_name: nil, process_day: nil, address: '123 Main St', contect: '123-456-7890' }
  }
  let(:new_valid_attrbutes) {attributes_for(:warehouse, warehouse_name:"orlando") }
  let(:update_valid_attrbutes) {attributes_for(:warehouse, warehouse_name:nil) }
  let(:warehouse) { FactoryBot.create(:warehouse) }
    before do
        sign_in current_account
    end
   
    describe 'GET#index' do
      it 'it should return all warehouse' do
      get :index
      expect(response).to have_http_status(:ok) 
      end
    end
    describe 'POST#create' do
     context 'with valid attributes' do
      it 'creates a new warehouse' do
        post :create, params: { warehouse: valid_attributes }
        expect(response).to have_http_status(:created)
      end
      it 'with invalid params' do
        post :create, params: { warehouse: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
     end
    end
    describe 'PATCH#update' do
      context 'with valid attributes' do
        it 'should update the attributes' do
          patch :update, params: {id: warehouse.id, warehouse: new_valid_attrbutes }
          expect(response).to have_http_status(:ok)
        end
        it 'not updated the attributes' do
          patch :update, params: {id: warehouse.id, warehouse: update_valid_attrbutes }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end 

    describe 'DESTROY#delete' do
      it 'destroys the warehouse'do
        delete :destroy, params: { id: warehouse.id }
        expect(response).to have_http_status(:no_content)
      end
    end
end