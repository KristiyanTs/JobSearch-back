class InvitationsController < ApplicationController

  def index
    @node = Node.find(params[:node_id])
    
    render json: @node.invitations
  end
end
