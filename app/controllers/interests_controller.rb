class InterestsController < ApplicationController
  def index
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

  def destroy

  end

  private
  def interest_params
    params.require(:interest).permit(:name, :phone, :lesson, :grade)
  end
end