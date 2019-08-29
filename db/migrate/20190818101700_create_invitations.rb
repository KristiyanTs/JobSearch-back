class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.references :user, foreign_key: true
      t.references :node, foreign_key: true
      t.references :role, foreign_key: true
      t.string :email, null: false
      t.boolean :rejected, default: false

      t.timestamps
    end
  end
end
