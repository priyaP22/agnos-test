class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  after_save do
    puts 'calculate total amount for order and save'
    order.calculate_and_save_total_amount
  end
end
