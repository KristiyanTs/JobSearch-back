class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :grade
      t.integer :lesson
      t.text :information
      t.datetime :start

      t.timestamps
    end
  end
end
