# frozen_string_literal: true

class Users::ProjectsController < ApplicationController
  respond_to :json

  def index
    render json: current_user.accessible_projects
  end

  def create
    project = current_user.nodes.create(project_params)

    if project.save
      render json: project, status: :ok
    else
      render json: project.errors, status: :unprocessable_entity
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :short_description)
  end
end