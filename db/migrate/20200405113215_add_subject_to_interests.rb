class AddSubjectToInterests < ActiveRecord::Migration[5.2]
  def change
    add_column :interests, :subject, :string
  end
end
