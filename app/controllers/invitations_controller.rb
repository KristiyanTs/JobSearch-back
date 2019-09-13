class InvitationsController < ApplicationController
  before_action :set_node

  def index
    @node = @node.root if @node.root_id
    
    render json: @node.invitations
  end

  def create
    @invitation = @node.invitations.new(invitation_params)

    if @invitation.save
      @invitation.send_to_user
      render json: @invitation, status: :ok
    else
      render json: @invitation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @invitation = @node.invitations.find(params[:id])

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

  def invitation_params
    params.require(:invitation).permit(:user_id, :email, :node_id, :role_id)
  end
end
