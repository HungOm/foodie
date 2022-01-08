class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :address_name
      t.string :address_line1
      t.string :address_line2
      t.string :address_city
      t.string :address_state
      t.integer :address_zip, validates: { length: { is: 5, message: 'Zip code should have 5 digit' } }
      t.string :address_country
      t.timestamps
    end
  end
end
