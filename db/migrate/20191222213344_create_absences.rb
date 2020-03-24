class CreateAbsences < ActiveRecord::Migration[5.2]
  def change
    create_table :absences do |t|
      t.references :membership, foreign_key: true
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
