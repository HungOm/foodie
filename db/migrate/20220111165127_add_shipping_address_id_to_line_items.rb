class AddShippingAddressIdToLineItems < ActiveRecord::Migration[6.0]
  def change
    add_column :line_items, :shipping_address_id, :integer
  end
end
