class VotesController < ApplicationController
  def index
    render json: all_votes
  end

  def create
    if Vote.create(vote_params)
      render json: all_votes, status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  private
  def all_votes
    query = "SELECT bulgarian, english, finance, programming, other FROM votes"
    ActiveRecord::Base.connection.execute(query)
  end
  
  def vote_params
    params.require(:vote).permit(:email, :bulgarian, :english, :finance, :programming, :other, :other_text)
  end
end