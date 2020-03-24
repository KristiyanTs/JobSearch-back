class AbsencesController < ApplicationController
  load_and_authorize_resource
  
  def index
    render json: Absence.all
  end

  def create
    if Absence.create(absence_params)
      render json: Absence.all, status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  private

  def find_lesson
    Lesson.find(params[:lesson][:id])
  end

  def absence_params
    params.require(:absences).map do |p|
      p.permit(:membership_id, :lesson_id, :excused)
    end
  end
end