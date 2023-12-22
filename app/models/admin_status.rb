class AdminStatus < ApplicationRecord
    enum status: {  pending: 1, shipped: 2, delivered: 3, cancelled: 4, completed: 5,Awaiting_Payment:6,Declined:7,Refunded:8,Rejected:9,Partially_Refunded:10 }
    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "id", "name", "updated_at"]
      end
end
