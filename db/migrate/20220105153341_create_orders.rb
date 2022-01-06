class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.datetime :order_datetime

      t.timestamps
    end
  end
end
