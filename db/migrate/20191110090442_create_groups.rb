class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.integer :grade, null: false
      t.integer :lesson_type, null: false
      t.text :information
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
