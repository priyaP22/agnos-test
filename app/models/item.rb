class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :tax_rate, presence: true

  has_many :order_items
end
