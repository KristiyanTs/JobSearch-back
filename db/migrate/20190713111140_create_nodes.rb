class CreateNodes < ActiveRecord::Migration[5.2]
  def change
    create_table :nodes do |t|
      t.string :title
      t.string :short_description
      t.text :description
      t.integer :priority
      t.references :root, index: true
      t.references :parent, index: true
      t.references :reporter, index: true
      t.references :assigned, index: true
      t.references :status, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
