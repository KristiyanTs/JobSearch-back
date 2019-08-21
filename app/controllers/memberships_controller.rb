class MembershipsController < ApplicationController

  def index
    @node = Node.find(params[:node_id])
    
    render json: @node.memberships
  end
end
