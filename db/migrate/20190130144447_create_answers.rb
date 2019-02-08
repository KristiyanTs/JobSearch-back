# frozen_string_literal: true

class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :body
      t.belongs_to :user, foreign_key: true
      t.belongs_to :question, foreign_key: true

      t.timestamps
    end
  end
end