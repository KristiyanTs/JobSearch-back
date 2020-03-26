class LessonsController < ApplicationController
  
  def index
    if params[:searching]
      if fulfill_all?
        @l = Lesson.all()

        # search by student
        @l = @l.where(group_id: Membership.where(user_id: params[:user_id]).select(:group_id).distinct()) if params[:user_id]
        # search by teacher
        @l = @l.where(teacher_id: params[:teacher_id]) if params[:teacher_id]

        # search by location
        @l = @l.where(group_id: Group.where(location_id: params[:loction_id]).select(:id).distinct()) if params[:location_id]
        
        # search by group
        @l = @l.where(group_id: params[:group_id]) if params[:group_id]
      else
        m = Lesson.where(group_id: Membership.where(user_id: params[:user_id]).select(:group_id).distinct()) if params[:user_id]
      
        # search by teacher
        t = Lesson.where(teacher_id: params[:teacher_id]) if params[:teacher_id]
  
        # search by location
        l = Lesson.where(group_id: Group.where(location_id: params[:loction_id]).select(:id).distinct()) if params[:location_id]
        
        # search by group
        g = Lesson.where(group_id: params[:group_id]) if params[:group_id]
        @l = [m, t, l, g].reject(&:nil?).reduce(:or).distinct()
      end
      render json: @l.map(&:attach_info)
    else
      render json: Lesson.all.map(&:attach_info)
    end
  end

  def show
    render json: Lesson.find(params[:id]).attach_info
  end

  def create
    @lesson = Lesson.new(lesson_params)
    authorize @lesson

    if @lesson.save
      render json: @lesson.attach_info, status: :ok
    else
      render json: @lesson.errors, status: :unprocessable_entity
    end
  end

  def create_weekly
    lesson = Lesson.find(params[:id])
    render json: Lesson.create_weekly(lesson, params[:until]).map(&:attach_info)
  end

  def update
    lesson = Lesson.find(params[:id])
    authorize lesson

    if lesson.update(lesson_params)
      render json: lesson.attach_info, status: :ok
    else
      render json: lesson.errors
    end
  end

  def destroy
    lesson = Lesson.find(params[:id])
    authorize lesson
    
    if lesson.destroy 
      render json: :ok
    else
      render status: :forbidden
    end
  end

  private
  def lesson_params
    params.require(:lesson).permit(:teacher_id, :group_id, :start_time, :end_time, :completed, :note, :location_id)
  end

  def fulfill_all?
    params[:fulfill_all] == "true"
  end
end