class MembershipsController < ApplicationController

  def index
    @node = Node.find(params[:node_id])
    
    render json: @node.memberships.map(&:attach_user_info)
  end

  def update
    @node = Node.find(params[:node_id])
    @membership = @node.memberships.find(params[:id])

    if @membership.update(membership_params)
      render json: @membership, status: :ok
    else
      render json: @membership.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @node = Node.find(params[:node_id])
    @membership = @node.memberships.find(params[:id])

    if @membership.destroy
      head :no_content
    else
      render json: @membership.errors, status: :unprocessable_entity
    end
  end

  private

  def membership_params
    params.require(:membership).permit(:role_id, :node_id)
  end
end
