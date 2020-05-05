class AddBalanceToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :balance, :decimal, default: 0.0, scale: 2, precision: 8
    add_column :users, :credit, :decimal, default: 0.0, scale: 2, precision: 8
  end
end
