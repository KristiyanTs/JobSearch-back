class PaymentsController < ApplicationController
  # before_action :authenticate_user!
  
  def index
    render json: Payment.all.map(&:attach_info)
  end

  def show
    render json: Payment.find(params[:id]).attach_info
  end

  def create
    payments = []
    p current_user
    
    payment_params.each do |payment_p|
      payment = Payment.new(payment_p)

      if payment.membership_id
        payment.payer_id = payment.membership_id
        payment.payer_type = 'Membership'

        if current_user.admin
          payment.recipient = Academy.first
          payment.recipient_id = 1
          payment.recipient_type = 'Academy'
        else
          payment.recipient = current_user
          payment.recipient_id = current_user.id
          payment.recipient_type = 'User'
        end
      else
        if payment.payer_id
          payment.recipient = Academy.first
          payment.recipient_id = 1
          payment.recipient_type = 'Academy'
        elsif payment.recipient_id
          payment.payer = Academy.first
          payment.payer_id = 1
          payment.payer_type = 'Academy'
        end
      end

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
      p.permit(:membership_id, :note, :amount, :payer_id, :payer_type, :recipient_id, :recipient_type)
    end
  end
end