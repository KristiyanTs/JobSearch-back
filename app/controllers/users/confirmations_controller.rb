# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController
  respond_to :json

  def update
    @user = User.find_by(confirmation_token: params[:confirmation_token])
    @user.confirm if @user.valid?

    render json: @user
  end
end
