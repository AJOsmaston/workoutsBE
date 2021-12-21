class ExerciseLogsController < ApplicationController
  before_action :set_exercise_log, only: %i[ show update destroy ]
  before_action :get_exercise

  # GET /exercise_logs
  def index
    @exercise_log = @exercise.exercise_logs.all

    render json: @exercise_log
  end

  # POST /exercise_logs
  # POST /exercise_logs.json
  def create
    # @exercise.id = params[:exercise_id]
    @exercise_log = @exercise.exercise_logs.new(exercise_log_params)

    if @exercise_log.save
      render json: @exercise_log, status: :created
    else
      render json: @exercise_log.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /exercise_logs/1
  # PATCH/PUT /exercise_logs/1.json
  def update
    if @exercise_log.update(exercise_log_params)
      render json: @exercise_log, status: :ok
    else
      render json: @exercise_log.errors, status: :unprocessable_entity
    end
  end

  # DELETE /exercise_logs/1
  # DELETE /exercise_logs/1.json
  def destroy
    @exercise_log.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise_log
      @exercise_log = ExerciseLog.find(params[:id])
    end

    def get_exercise
      @exercise = Exercise.find(params[:exercise_id])
    end

    # Only allow a list of trusted parameters through.
    def exercise_log_params
      params.require(:exercise_log).permit(:set, :reps, :notes, :weight)
    end
end
