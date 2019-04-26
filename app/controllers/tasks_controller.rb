class TasksController < ApplicationController
  def index
    tasks = current_user.tasks.where(day: Date.parse(params[:day])).order(:status, :title)
    render json: tasks.as_json(methods: :total_time)
  end

  def create
    @task = current_user.tasks.new(task_params)

    if @task.save
      render json: @task.as_json(methods: :total_time), status: :ok
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def update
    @task = current_user.tasks.find(params[:id])

    if @task.update(task_params)
      render json: @task.as_json(methods: :total_time), status: :ok
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
    params.require(:task).permit(:title, :status, :day)
  end
end
