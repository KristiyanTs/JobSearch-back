class NotesController < ApplicationController
  before_action :set_note, except: [:index, :create]

  def index
    render json: current_user.notes.as_json
  end

  def show
    render json: @note.as_json
  end

  def create
    @note = current_user.notes.new(note_params)

    if @note.save
      render json: @note.as_json, status: :ok
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  def update
    if @note.update(note_params)
      render json: @note, status: :ok
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @note.destroy
      head :no_content
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  private 
  def set_note
    @note = current_user.notes.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content)
  end
end
