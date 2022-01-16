class AddTotalPriceToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :price, :decimal,:precision=>8,:scale=>2,:default => 0
    #Ex:- :default =>''
  end
end
