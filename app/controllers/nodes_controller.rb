class NodesController < ApplicationController
  before_action :set_node, only: [:show, :update, :destroy]

  def index
    render json: Node.where(reporter: current_user, root_id: nil).map(&:attach_node_info)
  end

  def show
    render json: @node.attach_node_info
  end

  def create
    node = current_user.nodes.new(node_params)
    
    if node_params[:parent_id]
      node_parent = Node.find(node_params[:parent_id])
      node_root = node_parent.root || node_parent
      node.root_id = node_root.id
    end

    if node.save
      Favorite.create(user: current_user, node: node) unless node_params[:parent_id]
      render json: node.attach_node_info, status: :ok
    else
      render json: node.errors, status: :unprocessable_entity
    end
  end

  def update
    if @node.update(node_params)
      render json: @node
    else
      render json: @node.errors
    end
  end

  def destroy
    if @node.destroy
      head :no_content
    else
      render json: @node.errors, status: :unprocessable_entity
    end
  end

  private
  def set_node
    @node = Node.find(params[:id])
  end

  def node_params
    params.require(:node).permit(:title, :short_description, :description, :parent_id, :status_id, :category_id)
  end
end
