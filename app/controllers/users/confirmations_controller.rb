# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController
  respond_to :json

  private

  def after_confirmation_path_for(resource_name, resource)
    sign_in(resource)
    render json: resource, status: 200
  end
end
