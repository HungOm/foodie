class AddShippingAddressIdToFood < ActiveRecord::Migration[6.0]
  def change
    add_column :foods, :shipping_address_id, :integer
  end
end
