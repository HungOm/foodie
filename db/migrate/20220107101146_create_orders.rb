class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.datetime :order_datetime
      t.integer :user_id
      t.boolean :completed,{:default=>false}
      t.integer :quantity
      t.timestamps
    end
  end
end
