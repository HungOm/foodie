class AddFoodIdToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :food_id, :integer
  end
end
