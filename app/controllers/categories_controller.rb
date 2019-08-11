class CategoriesController < ApplicationController
  before_action :get_category, only: [:show, :update, :destroy]

  def index
    node = Node.find(params[:node_id])
    node = node.root if node.root_id
    
    render json: node.categories
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
    if category.destroy
      head :no_content
    else
      render json: category.errors, status: :unprocessable_entity
    end
  end

  private 
  def get_category
    category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:label, :icon, :color, :node_id)
  end
end
