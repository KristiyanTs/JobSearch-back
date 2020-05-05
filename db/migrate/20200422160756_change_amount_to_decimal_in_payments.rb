class ChangeAmountToDecimalInPayments < ActiveRecord::Migration[5.2]
  def up
    change_column :payments, :amount, :decimal, default: 0.0, scale: 2, precision: 6
    add_column :payments, :recipient_id, :bigint
    add_column :payments, :recipient_type, :string
    add_column :payments, :payer_id, :bigint
    add_column :payments, :payer_type, :string
  end

  def down
    change_column :payments, :amount, :integer
    remove_column :payments, :recipient_id
    remove_column :payments, :payer_id
    remove_column :payments, :recipient_type
    remove_column :payments, :payer_type
  end
end
