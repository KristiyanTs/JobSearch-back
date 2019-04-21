class TasksController < ApplicationController
  def index
    Task.create_recurrent(current_user) if Date.parse(params[:day]) == Date.today
    render json: current_user.tasks.where(day: Date.parse(params[:day])).order(:completed, :title)
  end

  def create
    @task = current_user.tasks.new(task_params)

    if @task.save
      render json: @task, status: :ok
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def update
    @task = current_user.tasks.find(params[:id])

    if @task.update(task_params)
      render json: @task, status: :ok
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
  end

  private

  def task_params
    params.require(:task).permit(:title, :body, :recurrent, :flag, :completed, :day)
  end
end
