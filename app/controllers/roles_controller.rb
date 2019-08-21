class RolesController < ApplicationController

  def index
    node = Node.find(params[:node_id])
    
    render json: node.roles
  end
end
