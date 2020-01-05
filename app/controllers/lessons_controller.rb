class LessonsController < InheritedResources::Base
  before_action :get_course
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

# GET /lessons
# GET /lessons.json
  def index
    @lessons = @course.lessons
  end

# GET /lessons/1
# GET /lessons/1.json
  def new
    @lesson = @course.lessons.build
  end

# POST /lessons
# POST /lessons.json
  def create
    @lesson = @course.lessons.build(lesson_params)

        respond_to do |format|
         if @lesson.save
            format.html { redirect_to course_lessons_path(@course), notice: 'Lesson was successfully created.' }
            format.json { render :show, status: :created, location: @lesson }
         else
            format.html { render :new }
            format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

# PATCH/PUT /lessons/1
# PATCH/PUT /lessons/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to lesson_course_path(@lesson), notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

# DELETE /lessons/1
# DELETE /lessons/1.json
  def destroy
    @course.destroy
     respond_to do |format|
      format.html { redirect_to lesson_courses_path(@lesson), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def lesson_params
      params.require(:lesson).permit(:title, :start, :end, :course_id, :status_id)
    end

    def get_course
      @course = Course.find(params[:course_id])
    end

    def set_lesson
    @lesson = @course.lessons.find(params[:id])
    end

end
