class AddImageUrlToFood < ActiveRecord::Migration[6.0]
  def change
    add_column :foods, :image_url, :string
  end
end
