class LessonsController < ApplicationController
  def index
    render json: Lesson.all.map(&:attach_info)
  end

  def show
    render json: Lesson.find(params[:id]).attach_info
  end

  def create
    lesson = Lesson.new(lesson_params)

    if lesson.save
      render json: lesson.attach_info, status: :ok
    else
      render json: lesson.errors, status: :unprocessable_entity
    end
  end

  def create_weekly
    lesson = Lesson.find(params[:id])
    render json: Lesson.create_weekly(lesson, params[:until]).map(&:attach_info)
  end

  def update
    lesson = Lesson.find(params[:id])

    if lesson.update(lesson_params)
      render json: lesson.attach_info, status: :ok
    else
      render json: lesson.errors
    end
  end

  def destroy
    lesson = Lesson.find(params[:id])
    if lesson.destroy 
      render json: :ok
    else
      render status: :forbidden
    end
  end

  private
  def lesson_params
    params.require(:lesson).permit(:teacher_id, :group_id, :start_time, :end_time, :completed, :note, :location_id)
  end
end