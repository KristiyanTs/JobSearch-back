class Users::FavoritesController < ApplicationController

  def index
    root = Node.find(params[:root_id])
    render json: root.subtree.where(id: current_user.favorites.pluck(:node_id))
  end

  def create
    favorite = current_user.favorites.new(favorite_params)

    if favorite.save
      render json: favorite.node, status: :ok
    else
      render json: favorite.errors, status: :unprocessable_entity
    end
  end

  def destroy
    favorite = current_user.favorites.find_by(node_id: params[:id])
    
    if favorite.destroy
      head :no_content
    else
      render json: favorite.errors, status: :unprocessable_entity
    end
  end

  private
  
  def favorite_params
    params.require(:favorite).permit(:node_id)
  end
end
