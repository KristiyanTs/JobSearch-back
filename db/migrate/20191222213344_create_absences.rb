class CreateAbsences < ActiveRecord::Migration[5.2]
  def change
    create_table :absences do |t|
      t.references :membership, foreign_key: true
      t.references :lesson, foreign_key: true
      t.boolean :excused, default: false

      t.timestamps
    end
  end
end
