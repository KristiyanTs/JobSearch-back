class MembershipsController < ApplicationController
  before_action :set_group

  def index
    render json: @group.memberships
  end

  def show
    render json: @group.memberships.find(paramsp[:id])
  end

  def create
    @membership = @group.memberships.new(membership_params)

    if @membership.save
      render json: @membership, status: :ok
    else
      render json: @membership.errors, status: :unprocessable_entity
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
    @membership = @group.memberships.find(params[:id])
    @membership.destroy

    render json: :ok
  end

  private
  def set_group
    @group = Group.find(params[:group_id])
  end

  def membership_params
    params.require(:membership).permit(:user_id)
  end
end