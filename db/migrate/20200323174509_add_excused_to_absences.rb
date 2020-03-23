class AddExcusedToAbsences < ActiveRecord::Migration[5.2]
  def change
    add_column :absences, :excused, :boolean, default: false
  end
end
