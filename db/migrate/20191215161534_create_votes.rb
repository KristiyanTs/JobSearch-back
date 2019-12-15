class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.boolean :programming
      t.boolean :english
      t.boolean :bulgarian
      t.boolean :finance
      t.boolean :other
      t.string :other_text
      t.string :email

      t.timestamps
    end
  end
end
