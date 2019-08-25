class CategoriesController < ApplicationController
  before_action :set_node
  before_action :set_category, only: [:show, :update, :destroy]

  def index
    @node = @node.root if @node.root_id
    
    render json: @node.categories
  end

  def show
    render json: @category
  end

  def create
    @category = Node.categories.new(status_params)

    if @category.save
      render json: @category, status: :ok
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def update
    if @category.update(category_params)
      render json: @category, status: :ok
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @category.destroy
      head :no_content
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  private

  def set_node
    @node = Node.find(params[:node_id])
  end

  def set_category
    @category = @node.categories.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:label, :icon, :color, :node_id)
  end
end
