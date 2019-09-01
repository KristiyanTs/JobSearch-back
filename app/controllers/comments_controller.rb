class CommentsController < ApplicationController
  before_action :set_node
  before_action :set_comment, only: [:update, :destroy]

  def index
    render json: @node.comments.where(ancestry: nil).map(&:has_replies)
  end

  def show
    render json: @node.comments.where(ancestry: params[:id])
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.ancestry = nil if @comment.ancestry == ""

    if @comment.save
      render json: @comment, status: :ok
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment_params)
      render json: @comment, status: :ok
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @comment.destroy
      head :no_content
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

  def set_node
    @node = Node.find_by_id(params[:node_id])
  end

  def set_comment
    @comment = @node.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :ancestry, :node_id)
  end
end
