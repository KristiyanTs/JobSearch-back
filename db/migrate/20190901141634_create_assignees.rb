class CreateAssignees < ActiveRecord::Migration[5.2]
  def change
    create_table :assignees do |t|
      t.references :user, foreign_key: true
      t.references :node, foreign_key: true

      t.timestamps
    end
  end
end
