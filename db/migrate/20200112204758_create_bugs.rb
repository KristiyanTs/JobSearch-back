class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.string :title, null: false
      t.text :description
      t.boolean :fixed, default: false

      t.timestamps
    end
  end
end
