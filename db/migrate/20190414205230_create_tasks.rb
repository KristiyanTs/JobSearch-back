class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :body
      t.boolean :completed, default: false
      t.boolean :recurrent, default: false
      t.string :flag
      t.references :user, foreign_key: true, null: false
      t.date :day

      t.timestamps
    end
  end
end
