class InvitationsController < ApplicationController
  before_action :set_node
  before_action :set_invitation, only: [:show, :update, :destroy]

  def index
    @node = @node.root if @node.root_id
    
    render json: @node.invitations
  end

  def show
    render json: @invitation
  end

  def create
    @invitation = @node.invitations.new(invitation_params)

    if @invitation.save
      render json: @invitation, status: :ok
    else
      render json: @invitation.errors, status: :unprocessable_entity
    end
  end

  def update
    if @invitation.update(invitation_params)
      render json: @invitation, status: :ok
    else
      render json: @invitation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @invitation.destroy
      head :no_content
    else
      render json: @invitation.errors, status: :unprocessable_entity
    end
  end

  private

  def set_node
    @node = Node.find(params[:node_id])
  end

  def set_invitation
    @invitation = @node.invitations.find(params[:id])
  end

  def invitation_params
    params.require(:invitation).permit(:user_id, :email, :node_id)
  end
end
