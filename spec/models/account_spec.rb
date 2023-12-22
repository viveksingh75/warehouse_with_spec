require 'rails_helper'

RSpec.describe Account, type: :model do
    describe 'associations' do
      it { is_expected.to have_many(:obtain_coupons) }
    end
    describe 'enums' do
      it { should define_enum_for(:user_type).with_values(seller: 0, buyer: 1) }
    end
    describe 'devise modules' do
        let(:valid_attributes) do
          {
            email: 'admin@example.com',
            password: 'valid_password',
            password_confirmation: 'valid_password'
          }
        end
        it 'is expected to be valid' do
          admin_user = Account.new(valid_attributes)
          expect(admin_user).to be_valid
        end
        it 'is expected to allow :password_confirmation to be "valid_password"' do
          admin_user = Account.new(valid_attributes)
          expect(admin_user).to allow_value('valid_password').for(:password_confirmation)
        end
        it { should validate_presence_of(:email) }
        it { should validate_uniqueness_of(:email).case_insensitive }
        it { should allow_value('admin@example.com').for(:email) }
        it { should_not allow_value('invalid_email').for(:email) }
        it { should validate_presence_of(:password).on(:create) }
        it { should validate_length_of(:password).is_at_least(Devise.password_length.first).on(:create) }
        it { should validate_length_of(:password).is_at_most(Devise.password_length.last).on(:create) }
        it { should validate_confirmation_of(:password) }
        it { should_not allow_value('invalid_password').for(:password_confirmation) }
    
    end
end
