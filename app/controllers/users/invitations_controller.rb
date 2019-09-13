# frozen_string_literal: true

class Users::InvitationsController < ApplicationController
  respond_to :json

  def index
    render json: current_user.active_invitations
  end

  # receives declined: true if declined and accepted: true if accepted
  def update
    @invitation = Invitation.find(params[:id]);

    if invitation_params[:accepted]
      @invitation.accept
    else
      @invitation.decline
    end

    render json: current_user.active_invitations
  end

  private
  def invitation_params
    params.require(:invitation).permit(:declined, :accepted)
  end
end