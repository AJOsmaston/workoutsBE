class CreateExerciseLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :exercise_logs do |t|
      t.integer :set
      t.integer :reps
      t.text :notes

      t.timestamps
    end
  end
end
