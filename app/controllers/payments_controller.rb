class PaymentsController < ApplicationController
  load_and_authorize_resource
  
  def index
    render json: Payment.all.map(&:attach_info)
  end

  def show
    render json: Payment.find(params[:id]).attach_info
  end

  def create
    if payments = Payment.create(payment_params)
      render json: payments.map(&:attach_info), status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  def update
    payment = Payment.find(params[:id])

    if payment.update(payment_params)
      render json: payment.attach_info
    else
      render status: :unprocessable_entity
    end
  end

  def destroy
    payment = Payment.find(params[:id])

    if payment.destroy
      render json: :ok
    else
      render status: :unprocessable_entity
    end
  end

  private
  def payment_params
    params.permit(:payments, array: [:membership_id, :note, :amount])
  end
end