class AddWeightToLog < ActiveRecord::Migration[7.0]
  def change
    add_column :exercise_logs, :weight, :string
  end
end
