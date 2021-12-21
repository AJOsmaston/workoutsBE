class AssociateExercisesWithLog < ActiveRecord::Migration[7.0]
  def change
    add_reference :exercise_logs, :exercise, null:false, foreign_key: true
  end
end
