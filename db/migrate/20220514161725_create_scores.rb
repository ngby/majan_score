class CreateScores < ActiveRecord::Migration[6.1]
  def change
    create_table :scores do |t|
      t.string :first_user
      t.float :first_score
      t.string :second_user
      t.float :second_score
      t.string :third_user
      t.float :third_score
      t.string :fourth_user
      t.float :fourth_score

      t.timestamps
    end
  end
end
