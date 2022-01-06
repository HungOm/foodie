class AddPriceAndDescriptionToFood < ActiveRecord::Migration[6.0]
  def change
    add_column :foods, :price, :integer
    add_column :foods, :description, :text
  end
end
