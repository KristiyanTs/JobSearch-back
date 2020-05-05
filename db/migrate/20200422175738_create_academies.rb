class CreateAcademies < ActiveRecord::Migration[5.2]
  def change
    create_table :academies do |t|
      t.string :name
      t.string :contact_number
      t.decimal :balance, default: 0.0, scale: 2, precision: 12

      t.timestamps
    end
  end
end
