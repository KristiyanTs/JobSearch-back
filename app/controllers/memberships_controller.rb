class MembershipsController < ApplicationController
  before_action :set_group

  def index
    render json: @group.memberships.map(&:attach_student)
  end

  def show
    render json: @group.memberships.find(paramsp[:id]).attach_student
  end

  def create
    membership = Membership.new(membership_params)
    authorize membership

    if membership.save
      render json: @group.memberships.map(&:attach_student), status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  def update
    @membership = @group.memberships.find(params[:id])
    authorize @membership

    if @membership.update(membership_params)
      render json: @membership
    else
      render json: @membership.errors
    end
  end

  def destroy
    ids = params[:id].split(',')
    @group.memberships.where(id: ids).each do |mem|
      authorize mem
      mem.destroy
    end

    render json: :ok
  end

  private
  def set_group
    @group = Group.find(params[:group_id])
  end

  def membership_params
    params.require(:memberships).map do |m|
      m.permit(:user_id, :group_id)
    end
  end
end