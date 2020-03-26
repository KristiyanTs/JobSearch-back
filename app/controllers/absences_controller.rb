class AbsencesController < ApplicationController
  
  def index
    render json: Absence.all
  end

  def create
    @absences = []
    absence_params.each do |abs_params|
      @absence = Absence.new(abs_params)
      authorize @absence
      @absences << @absence
    end

    if @absences.each(&:save)
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