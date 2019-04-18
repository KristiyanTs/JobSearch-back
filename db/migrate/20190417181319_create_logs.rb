class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.text :content
      t.date :day
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
