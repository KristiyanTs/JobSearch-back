class AddSignaledToAbsences < ActiveRecord::Migration[5.2]
  def change
    add_reference :absences, :signaled, default: false
  end
end
