# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def show
    render json: current_user
  end

  # Should be fixed
  # One action for updatiing without a password
  # One action for updating more important parameters with a password
  def update_profile
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    resource.avatar.attach(account_update_params[:avatar]) if account_update_params[:avatar]
    resource_updated = resource.update_without_password(account_update_params)
    yield resource if block_given?

    if resource_updated
      bypass_sign_in resource, scope: resource_name
      render json: resource, status: 200
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
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
    params.require(:user).permit(:avatar, :name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:avatar, :name, :email, :password, :password_confirmation, :current_password)
  end
end
