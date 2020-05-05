class PricingsController < ApplicationController
  
  def index
    render json: Pricing.all
  end

  def create
    pricing = Pricing.new(pricing_params)

    authorize pricing

    if pricing.save
      render json: pricing, status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  def update
    pricing = Pricing.find(params[:id])
    authorize pricing

    if pricing.update(pricing_params)
      render json: pricing, status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  def destroy
    pricing = Pricing.find(params[:id])
    authorize pricing

    if pricing.destroy
      render json: :ok
    else
      render status: :unprocessable_entity
    end
  end

  private  
  def pricing_params
    params.require(:pricing).permit(:title, :credit_price)
  end
end