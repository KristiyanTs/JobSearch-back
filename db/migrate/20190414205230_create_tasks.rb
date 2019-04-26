class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.date :day
      t.datetime :times, array: true, default: []
      t.integer :status, default: 0
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
