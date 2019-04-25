class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.date :day
      t.boolean :completed, default: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
