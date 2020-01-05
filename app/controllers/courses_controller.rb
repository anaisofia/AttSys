class CoursesController < InheritedResources::Base
  protect_from_forgery
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! && :authenticate_teacher!

  # GET /courses
  # GET /courses.json
  def index
    if teacher_signed_in?
      @courses = Course.where(courses: {teacher: current_teacher, active: true})
    elsif user_signed_in?
      @courses = Course.where(courses: {courses_user: current_user})
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
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
