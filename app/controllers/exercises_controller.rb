class ExercisesController < ApplicationController
  before_action :set_exercise, only: %i[ show update destroy ]

  # GET /exercises
  # GET /exercises.json
  def index
    @exercises = Exercise.all
    render json: @exercises
  end

  # GET /exercises/1
  # GET /exercises/1.json
  def show
    render json: @exercise
  end

  # POST /exercises
  # POST /exercises.json
  def create
    @exercise = Exercise.new(exercise_params)

    if @exercise.save
      render :show, status: :created, location: @exercise
    else
      render json: @exercise.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /exercises/1
  # PATCH/PUT /exercises/1.json
  def update
    if @exercise.update(exercise_params)
      render :show, status: :ok, location: @exercise
    else
      render json: @exercise.errors, status: :unprocessable_entity
    end
  end

  # DELETE /exercises/1
  # DELETE /exercises/1.json
  def destroy
    @exercise.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise
      @exercise = Exercise.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exercise_params
      params.require(:exercise).permit(:name)
    end
end
