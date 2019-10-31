class CoursesController < InheritedResources::Base

  private

    def course_params
      params.require(:course).permit(:title, :start, :finish, :user_id, :level_id, :teacher_id)
    end

end
