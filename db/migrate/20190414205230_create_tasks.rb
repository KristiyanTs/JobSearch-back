class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.integer :status, default: 0
      t.integer :position
      t.date :day
      t.datetime :times, array: true, default: []
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
