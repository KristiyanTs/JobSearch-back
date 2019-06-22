class AddFieldsToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :description, :text
    add_column :tasks, :color, :string, default: "#8898aa"
    add_column :tasks, :start_time, :datetime
    add_column :tasks, :end_time, :datetime
    add_column :tasks, :timezone, :string
    add_column :tasks, :repeat_until, :date
    add_reference :tasks, :task, foreign_key: true
  end
end
