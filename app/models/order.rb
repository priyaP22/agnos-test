class Order < ApplicationRecord
  include AASM

  enum state: {created: 1, paid: 2, completed: 3, delivered: 4}
  has_many :order_items

  aasm :column => 'state', enum: true do
    state :created, initial: true
    state :paid, :completed, :delivered

    event :pay do
      transitions from: :created, to: :paid
    end

    event :complete do
      transitions from: :paid, to: :completed, after: NotifyUser
    end

    event :deliver do
      transitions from: :completed, to: :delivered
    end
  end

  def calculate_and_save_total_amount
    amount = 0
    order_items.each {|order_item| amount += order_item.item.price}
    update(total_amount: amount)
  end

  def NotifyUser

  end
end
