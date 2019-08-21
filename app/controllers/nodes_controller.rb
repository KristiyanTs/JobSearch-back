class NodesController < ApplicationController
  before_action :set_node, only: [:show, :update, :destroy]

  def index
    render json: Node.where(reporter: current_user, root_id: nil).map(&:attach_node_info)
  end

  def show
    render json: @node.attach_node_info
  end

  def create
    node = current_user.nodes.new(node_params)
    
    if node_params[:parent_id]
      node_parent = Node.find(node_params[:parent_id])
      node_root = node_parent.root || node_parent
      node.root_id = node_root.id
    end

    if node.save
      Favorite.create(user: current_user, node: node) unless node_params[:parent_id]
      render json: node.as_json, status: :ok
    else
      render json: node.errors, status: :unprocessable_entity
    end
  end

  def update
    if node_params[:categories_attributes]
      categories_to_remove = @node.categories.pluck(:id) - node_params[:categories_attributes].pluck(:id)
      @node.categories.where(id: categories_to_remove).destroy_all
    end

    if node_params[:statuses_attributes]
      statuses_to_remove = @node.statuses.pluck(:id) - node_params[:statuses_attributes].pluck(:id)
      @node.statuses.where(id: statuses_to_remove).destroy_all
    end

    if node_params[:roles_attributes]
      roles_to_remove = @node.roles.pluck(:id) - node_params[:roles_attributes].pluck(:id)
      @node.roles.where(id: roles_to_remove).destroy_all
    end

    if node_params[:memberships_attributes]
      memberships_to_remove = @node.memberships.pluck(:id) - node_params[:memberships_attributes].pluck(:id)
      @node.memberships.where(id: memberships_to_remove).destroy_all
    end

    if node_params[:invitations_attributes]
      inviations_to_remove = @node.invitations.pluck(:id) - node_params[:invitations_attributes].pluck(:id)
      @node.invitations.where(id: invitations_to_remove).destroy_all
    end

    if @node.update(node_params)
      render json: @node
    else
      render json: @node.errors
    end
  end

  def destroy
    if @node.destroy
      head :no_content
    else
      render json: @node.errors, status: :unprocessable_entity
    end
  end

  private
  def set_node
    @node = Node.find(params[:id])
  end

  def node_params
    params.require(:node).permit(:title, :short_description, :description, :parent_id, :status_id, :category_id,
                    statuses_attributes:    [:id, :title, :description, :color, :node_id],
                    categories_attributes:  [:id, :title, :description, :color, :icon, :icon_color, :node_id],
                    roles_attributes:       [:id, :title, :node_id,
                      permissions_attributes: [:id, :instance, :ability, :role_id]],
                    memberships_attributes: [:id, :user_id, :node_id, :role_id],
                    invitations_attributes: [:id, :email, :node_id])
  end
end
