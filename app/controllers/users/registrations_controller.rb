# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def show
    render json: current_user
  end

  def update_profile
    @user = current_user
    if @user.update(account_update_params.except("current_password"))
      render json: @user
    else
      render json: @user.errors
    end    
  end

  def create
    build_resource(sign_up_params)
    if resource.save
      render json: resource, status: 201
    else
      render json: resource.errors.full_messages, status: 409
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end
end
