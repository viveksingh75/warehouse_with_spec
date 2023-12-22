FactoryBot.define do
    factory :account do
      email { Faker::Internet.email }
      password { 'password' }
      password_confirmation { 'password' }
      first_name { 'vivek' }
      last_name { 'singh' }
      address { 'address' }
      user_type {"seller"}
        
    end
end 
  