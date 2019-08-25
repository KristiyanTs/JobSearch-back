class RolesController < ApplicationController
  before_action :set_node
  before_action :set_role, only: [:show, :update, :destroy]

  def index
    @node = @node.root if @node.root_id
    
    render json: @node.roles
  end

  def show
    render json: @role
  end

  def create
    @role = @node.roles.new(role_params)

    if @role.save
      render json: @role, status: :ok
    else
      render json: @role.errors, status: :unprocessable_entity
    end
  end

  def update
    if @role.update(role_params)
      render json: @role, status: :ok
    else
      render json: @role.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @role.destroy
      head :no_content
    else
      render json: @role.errors, status: :unprocessable_entity
    end
  end

  private

  def set_node
    @node = Node.find(params[:node_id])
  end

  def set_role
    @role = @node.roles.find(params[:id])
  end

  def role_params
    params.require(:role).permit(:title, :node_id)
  end
end
