json.extract! exercise_log, :id, :set, :reps, :notes, :created_at, :updated_at
json.url exercise_log_url(exercise_log, format: :json)
