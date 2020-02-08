class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :address, null: false
      t.string :title, null: false
      t.string :color, default: '#1976d2', null: false

      t.timestamps
    end
  end
end
