require 'rails_helper'
describe Admin::CataloguesController, :type => :controller do

    before(:each) do
      @user = FactoryBot.create(:admin_user)
      sign_in @user
    end
    it 'creates an catalogues' do
      expect{post :create, name: "test_name"}.to change{Catalogue.count}.by(1)
    end
  
end