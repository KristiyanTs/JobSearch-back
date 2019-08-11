class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.string :title
      t.string :color
      t.string :description
      t.references :node, index: true

      t.timestamps
    end
  end
end
