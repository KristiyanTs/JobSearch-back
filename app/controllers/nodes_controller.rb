class NodesController < ApplicationController
  before_action :set_node, only: [:show, :update, :destroy]

  def index
    render json: Node.where(reporter: current_user)
  end

  def subtree
    render json: Node.find(params[:node_id]).children.map{ |child| 
      has_children = child.children.size > 0
      # the line below doesn't work for some reason and is nice to have
      # child = child.as_json(only: [:id, :title])
      child = child.as_json
      child['children']=[] if has_children
      child 
    }
  end

  def show
    render json: @node.attach_ancestry
  end

  def create
    @node = current_user.nodes.new(node_params)

    if @node.save
      render json: @node, status: :ok
    else
      render json: @node.errors, status: :unprocessable_entity
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
    params.require(:node).permit(:title, :short_description, :description, :status_id, :category_id, :ancestry)
  end
end
