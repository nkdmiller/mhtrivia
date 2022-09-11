class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.references :room, null: false, foreign_key: true
      t.integer :order
      t.text :prompt
      t.string :answers, array: true, default: []
      t.string :correct_answer

      t.timestamps
    end
  end
end
