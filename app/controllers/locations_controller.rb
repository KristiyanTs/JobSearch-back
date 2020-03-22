class LocationsController < ApplicationController
  load_and_authorize_resource
  
  def index
    render json: Location.all
  end

  def create
    location = Location.new(location_params)
    
    if location.save
      render json: location, status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  def update
    location = Location.find(params[:id])

    if location.update(location_params)
      render json: location, status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  def destroy
    location = Location.find(params[:id])

    if location.destroy
      render json: :ok
    else
      render status: :unprocessable_entity
    end
  end

  private  
  def location_params
    params.require(:location).permit(:title, :address, :color)
  end
end