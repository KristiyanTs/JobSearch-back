class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :title
      t.string :description
      t.string :color
      t.string :icon
      t.string :icon_color
      t.references :node, index: true

      t.timestamps
    end
  end
end
