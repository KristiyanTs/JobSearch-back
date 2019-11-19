class GroupsController < ApplicationController

  def index
    render json: Group.all
  end

  def show
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      render json: @group, status: :ok
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  def update
    @group = Group.find(params[:id])

    if @group.update(group_params)
      render json: @group
    else
      render json: @group.errors
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    render json: :ok
  end

  private
  def group_params
    params.require(:group).permit(:name, :start, :information, :lesson, :grade)
  end
end