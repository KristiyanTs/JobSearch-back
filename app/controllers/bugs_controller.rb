class BugsController < ApplicationController
  
  def index
    render json: Bug.all.order(:fixed)
  end

  def create
    bug = Bug.new(bug_params)
    
    if bug.save
      render json: bug, status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  def update
    bug = Bug.find(params[:id])

    if bug.update(bug_params)
      render json: bug, status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  def destroy
    bug = Bug.find(params[:id])

    if bug.destroy
      render json: :ok
    else
      render status: :unprocessable_entity
    end
  end

  private  
  def bug_params
    params.require(:bug).permit(:title, :description, :fixed)
  end
end