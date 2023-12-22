class Warehouse < ApplicationRecord
    validates :warehouse_name, presence: true
    validates :process_day, presence: true
    validates :address, presence: true
    validates :contect, presence: true
end
