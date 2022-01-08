class RemoveCompletedFromOrder < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :completed, :boolean
  end
end
