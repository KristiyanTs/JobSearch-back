class InterestsController < ApplicationController
  def index
    render json: Interest.all
  end

  def show
  end

  def create
    @interest = Interest.new(interest_params)

    if @interest.save
      render json: @interest, status: :ok
    else
      render json: @interest.errors, status: :unprocessable_entity
    end
  end

  def update
    @interest = Interest.find(params[:id])

    if @interest.update(interest_params)
      render json: @interest
    else
      render json: @interest.errors
    end
  end

  def destroy
    @interest = Interest.find(params[:id])
    @interest.destroy

    render json: :ok
  end

  private
  def interest_params
    params.require(:interest).permit(:name, :phone, :lesson, :grade, :active)
  end
end