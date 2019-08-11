class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :update, :destroy]

  def index
    render json: Node.where(id: current_user.favorites.pluck(:node_id))
  end

  def show
  end

  def create
    node = Node.find(favorite_params[:node_id])
    favorite = current_user.favorites.find_by(node: node)

    if favorite
      favorite.destroy
      render json: node.as_json.merge(favorite: current_user.is_favorite(node)), status: :ok
    else
      favorite = Favorite.new(favorite_params)
      favorite.user_id = current_user.id

      if favorite.save
        render json: node.as_json.merge(favorite: current_user.is_favorite(node)), status: :ok
      else
        render json: favorite.errors, status: :unprocessable_entity
      end
    end
  end

  def update
  end

  def destroy
    if favorite.destroy
      head :no_content
    else
      render json: favorite.errors, status: :unprocessable_entity
    end
  end

  private
  def set_favorite
    favorite = Favorite.find(params[:id])
  end

  def favorite_params
    params.require(:favorite).permit(:node_id)
  end
end
