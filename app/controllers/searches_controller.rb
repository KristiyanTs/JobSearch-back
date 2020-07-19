class SearchesController < ApplicationController
  def index
    debugger
    render json: User.where(role: 2).map(&:attach_info)
  end
end