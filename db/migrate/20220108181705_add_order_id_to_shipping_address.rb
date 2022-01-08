class AddOrderIdToShippingAddress < ActiveRecord::Migration[6.0]
  def change
    add_column :shipping_addresses, :order_id, :integer
  end
end
