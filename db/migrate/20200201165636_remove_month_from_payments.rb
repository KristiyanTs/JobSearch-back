class RemoveMonthFromPayments < ActiveRecord::Migration[5.2]
  def change
    remove_column :payments, :month
  end
end
