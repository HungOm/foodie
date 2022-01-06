class CreateGoodies < ActiveRecord::Migration[6.0]
  def change
    create_table :goodies do |t|
      t.string :name

      t.timestamps
    end
  end
end
