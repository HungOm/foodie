class AddLinedItemIdToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :line_item_id, :integer,:null => true
    #Ex:- :null => false
  end
end
