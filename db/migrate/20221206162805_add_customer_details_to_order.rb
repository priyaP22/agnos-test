class AddCustomerDetailsToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :customer_name,:string
    add_column :orders, :customer_phone_no,:string
  end
end
