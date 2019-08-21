class CreatePermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :permissions do |t|
      t.string :instance
      t.string :ability
      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end
