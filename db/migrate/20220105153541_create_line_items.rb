class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.integer :order_id
      t.integer :food_id
      t.integer :amount

      t.timestamps
    end
  end
end
