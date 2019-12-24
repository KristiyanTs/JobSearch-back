class AbsencesController < ApplicationController
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

  def absence_params
    params.permit(absence: [:user_id, :lesson_id]).require(:absence)
  end
end