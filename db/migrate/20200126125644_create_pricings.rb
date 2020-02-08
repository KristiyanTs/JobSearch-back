class CreatePricings < ActiveRecord::Migration[5.2]
  def change
    create_table :pricings do |t|
      t.integer :credit_price, null: false
      t.string :title, null: false

      t.timestamps
    end
  end
end
