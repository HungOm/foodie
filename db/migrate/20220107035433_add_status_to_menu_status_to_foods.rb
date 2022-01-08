class AddStatusToMenuStatusToFoods < ActiveRecord::Migration[6.0]
  def change
    add_column :foods, :menu_status, :integer, default: 0

  end
end
