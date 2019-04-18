class LogsController < ApplicationController
  def show
    render json: Log.find_or_create_by(day: params[:day], user_id: current_user.id)
  end

  def update
    @log = current_user.logs.find_by(day: log_params[:day])
    render json: @log.update(log_params)
  end

  private
  def log_params
    params.require(:log).permit(:day, :content)
  end
end
