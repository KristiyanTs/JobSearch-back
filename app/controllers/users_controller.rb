class UsersController < ApplicationController
  load_and_authorize_resource
  
  def index
    render json: User.all.map(&:attach_info)
  end

  def show
    render json: User.find(params[:id]).attach_info
  end

  def create
    user_params['password'] = "12341234"
    user_params['password_confirmation'] = "12341234"

    @user = User.new(user_params)
    @user.confirm

    if @user.save(validate: false)
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    render json: :ok
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :group_id, :role)
  end
end