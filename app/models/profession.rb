class Profession < ApplicationRecord
  belongs_to :cover_letter
  enum status: { "Not Started": 0, "Not Interested": 1, "Sent Application": 2, "Interviewing": 3, "Onsite Interview": 4, "Offer Received": 5, "Denied": 6, "Denied at Phone Screen": 7 }
  STATUS_ORDERS = [5, 4, 3, 0, 2, 1, 6, 7]
  scope :order_by_status, -> {
    order_by = ['CASE']
    STATUS_ORDERS.each_with_index do |status, index|
      order_by << "WHEN status=#{status} THEN #{index}"
    end
    order_by << 'END'
    order(order_by.join(' '))
  }
end
