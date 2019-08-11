class StatusesController < ApplicationController
  before_action :set_status, only: [:show, :update, :destroy]

  def index
    node = Node.find(params[:node_id])
    node = node.root if node.root_id
    
    render json: node.statuses
  end

  def show
  end

  def create
    node = Node.find(params[:node_id])
    status = node.statuses.new(status_params)

    if status.save
      render json: node.statuses, status: :ok
    else
      render json: status.errors, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
    if status.destroy
      head :no_content
    else
      render json: status.errors, status: :unprocessable_entity
    end
  end

  private 
  def set_status
    status = Status.find(params[:id])
  end

  def status_params
    params.require(:status).permit(:label, :color)
  end
end
