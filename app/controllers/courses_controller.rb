 class CoursesController < InheritedResources::Base
  protect_from_forgery

  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    if user_signed_in?
      @courses = current_entity.courses.active
    elsif teacher_signed_in?
      @courses = Course.where(courses: {teacher: current_entity, active: true})
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    #avoid users to see other students courses
    if user_signed_in?
      redirect_to courses_path if !@course.users.include?(current_entity)
    elsif teacher_signed_in?
     redirect_to courses_path if @course.teacher != current_entity
   end
    # redirect_to root_path if current_user.teacher? && !@course.users.include?(current_user)
    # @lessons = Lesson.where(course_id: (params[:id])).order('date DESC')
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    respond_to do |format|
      if @course.save

        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def course_params
    params.require(:course).permit(:title, :start, :finish, :user_ids, :level_id, :teacher_id, :active, :hours, :users, lessons_attributes: [:id, :title, :start, :end, :course_id, :status_id])
    params.require(:user).permit(:user_ids, :user_id)
    params.require(:courses_users).permit(:user_ids)
  end

  def set_course
    @course = Course.find(params[:id])
  end

end
