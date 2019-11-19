class CreateInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :interests do |t|
      t.string :name
      t.string :phone
      t.string :grade
      t.string :lesson
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
