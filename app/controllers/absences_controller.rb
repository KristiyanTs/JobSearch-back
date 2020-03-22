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

  def absence_params
    params.permit(:absences, array: [:user_id, :lesson_id, :signaled])
  end
end