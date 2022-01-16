class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.integer :user_id
      t.decimal :total_price, precision: 10, scale: 3   
   

      t.timestamps
    end
  end
end
