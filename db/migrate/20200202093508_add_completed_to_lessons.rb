class AddCompletedToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :completed, :boolean, default: false
  end
end
