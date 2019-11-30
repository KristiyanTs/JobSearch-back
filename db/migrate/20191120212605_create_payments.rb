class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.references :membership, foreign_key: true
      t.integer :amount, default: 0, null: false
      t.integer :month
      t.text :note

      t.timestamps
    end
  end
end
