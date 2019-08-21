class StatusesController < ApplicationController

  def index
    node = Node.find(params[:node_id])
    node = node.root if node.root_id
    
    render json: node.statuses
  end
end
