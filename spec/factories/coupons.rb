FactoryBot.define do
    factory :coupon do
      name { 'super' }
      coupon_code { 'passwo70' }
      discount { 300 }
      start_date { '2003-10-10' }
      end_date { '2022-03-12' }
      association :admin_user
      # association :admin_user, factory: :admin_user
    end
  end
