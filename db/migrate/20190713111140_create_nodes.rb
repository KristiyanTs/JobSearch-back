class CreateNodes < ActiveRecord::Migration[5.2]
  def change
    create_table :nodes do |t|
      t.string :title
      t.string :short_description
      t.text :description
      t.integer :priority
      t.string :ancestry, index: true
      t.references :reporter, index: true
      t.references :status, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
