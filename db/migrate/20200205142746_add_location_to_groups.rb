class AddLocationToGroups < ActiveRecord::Migration[5.2]
  def change
    add_reference :groups, :location, index: true
  end
end
