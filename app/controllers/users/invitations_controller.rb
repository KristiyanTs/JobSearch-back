# frozen_string_literal: true

class Users::InvitationsController < ApplicationController
  respond_to :json

  def index
    render json: current_user.invitations
  end

  def update
    # TODO
    # allow user to either accept or decline an invitation
    # if accepted, create a membership for this user within the node
    # & notify all members(except current user) that a new member joined
  end

  private
end