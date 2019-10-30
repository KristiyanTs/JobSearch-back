class CreateInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :interests do |t|
      t.string :name
      t.string :phone
      t.string :grade
      t.string :lesson

      t.timestamps
    end
  end
end
