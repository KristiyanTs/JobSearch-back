class StatusesController < ApplicationController
  before_action :set_node
  before_action :set_status, only: [:show, :update, :destroy]

  def index
    @node = @node.root if @node.root_id
    
    render json: @node.statuses
  end

  def show
    render json: @status
  end

  def create
    @status = Node.statuses.new(status_params)

    if @status.save
      render json: @status, status: :ok
    else
      render json: @status.errors, status: :unprocessable_entity
    end
  end

  def update
    if @status.update(status_params)
      render json: @status, status: :ok
    else
      render json: @status.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @status.destroy
      head :no_content
    else
      render json: @status.errors, status: :unprocessable_entity
    end
  end

  private

  def set_node
    @node = Node.find(params[:node_id])
  end

  def set_status
    @status = @node.statuses.find(params[:id])
  end

  def status_params
    params.require(:status).permit(:id, :title, :description, :color, :node_id)
  end
end
