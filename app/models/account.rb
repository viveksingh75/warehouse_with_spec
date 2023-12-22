class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :obtain_coupons
  has_many :obtain_catalogues
  has_many :coupons
  enum user_type: [:seller, :buyer]
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
         
end
