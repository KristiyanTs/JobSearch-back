class NodesController < ApplicationController
  before_action :set_node, only: [:show, :update, :destroy]

  def index
    render json: current_user.nodes
  end

  def show
    render json: {
      root: @node.root, 
      parent: @node.parent,
      node: @node.as_json.merge(favorite: current_user.is_favorite(@node)), 
      child_nodes: @node.children.where(category_id: nil, status_id: nil),
      child_tasks: @node.children.where.not(category_id: nil, status_id: nil)
    }
  end

  def create
    node = Node.new(node_params)
    
    if node_params[:parent_id]
      node_parent = Node.find(node_params[:parent_id])
      node_root = node_parent.root || node_parent
      node.root_id = node_root.id
    end

    if node.save
      Favorite.create(user: current_user, node: node) unless node_params[:parent_id]
      render json: node.as_json, status: :ok
    else
      render json: node.errors, status: :unprocessable_entity
    end
  end

  def update
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
    params.require(:node).permit(:title, :short_description, :description, :parent_id, :status_id, :category_id,
                    statuses_attributes:   [:id, :title, :description, :color, :node_id],
                    categories_attributes: [:id, :title, :description, :color, :icon, :icon_color, :node_id])
  end
end
