class MembershipsController < ApplicationController
  load_and_authorize_resource
  before_action :set_group

  def index
    render json: @group.memberships.map(&:attach_student)
  end

  def show
    render json: @group.memberships.find(paramsp[:id]).attach_student
  end

  def create
    if Membership.create(membership_params)
      render json: @group.memberships.map(&:attach_student), status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  def update
    @membership = @group.memberships.find(params[:id])

    if @membership.update(membership_params)
      render json: @membership
    else
      render json: @membership.errors
    end
  end

  def destroy
    ids = params[:id].split(',')
    memberships = 
    @group.memberships.where(id: ids).destroy_all
    render json: :ok
  end

  private
  def set_group
    @group = Group.find(params[:group_id])
  end

  def membership_params
    params.permit(:memberships, array: [:user_id, :group_id])
  end
end