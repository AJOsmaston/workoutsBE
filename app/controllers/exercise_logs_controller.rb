class ExerciseLogsController < ApplicationController
  before_action :set_exercise_log, only: %i[ show update destroy ]

  # GET /exercise_logs
  # GET /exercise_logs.json
  def index
    @exercise_logs = ExerciseLog.all
  end

  # GET /exercise_logs/1
  # GET /exercise_logs/1.json
  def show
  end

  # POST /exercise_logs
  # POST /exercise_logs.json
  def create
    @exercise_log = ExerciseLog.new(exercise_log_params)

    if @exercise_log.save
      render :show, status: :created, location: @exercise_log
    else
      render json: @exercise_log.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /exercise_logs/1
  # PATCH/PUT /exercise_logs/1.json
  def update
    if @exercise_log.update(exercise_log_params)
      render :show, status: :ok, location: @exercise_log
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

    # Only allow a list of trusted parameters through.
    def exercise_log_params
      params.require(:exercise_log).permit(:set, :reps, :notes)
    end
end
