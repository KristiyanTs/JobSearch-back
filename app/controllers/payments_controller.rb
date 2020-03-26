class PaymentsController < ApplicationController
  
  def index
    render json: Payment.all.map(&:attach_info)
  end

  def show
    render json: Payment.find(params[:id]).attach_info
  end

  def create
    payments = []
    payment_params.each do |payment_p|
      payment = Payment.new(payment_p)
      authorize payment
      payments << payment
    end

    if payments.each(&:save)
      render json: payments.map(&:attach_info), status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  def update
    payment = Payment.find(params[:id])
    authorize payment

    if payment.update(payment_params)
      render json: payment.attach_info
    else
      render status: :unprocessable_entity
    end
  end

  def destroy
    payment = Payment.find(params[:id])
    authorize payment
    
    if payment.destroy
      render json: :ok
    else
      render status: :unprocessable_entity
    end
  end

  private
  def payment_params
    params.require(:payments).map do |p|
      p.permit(:membership_id, :note, :amount)
    end
  end
end