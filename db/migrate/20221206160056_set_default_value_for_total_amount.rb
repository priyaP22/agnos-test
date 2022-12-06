class SetDefaultValueForTotalAmount < ActiveRecord::Migration[7.0]
  def change
    change_column_default :orders, :total_amount, 0
  end
end
