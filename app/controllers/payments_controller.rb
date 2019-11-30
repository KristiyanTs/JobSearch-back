class PaymentsController < ApplicationController
  def index
    render json: Payment.all.map(&:attach_info)
  end

  def show
    render json: Payment.find(params[:id]).attach_info
  end

  def create
    if Payment.create(payment_params)
      render status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy

  end

  private
  def payment_params
    params.permit(payment: [:membership_id, :note, :amount, :month]).require(:payment)
  end
end