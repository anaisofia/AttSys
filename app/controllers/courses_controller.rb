class CoursesController < InheritedResources::Base

  private

    def course_params
      params.require(:course).permit(:title, :start, :finish, :user_ids, :level_id, :teacher_id)
      params.require(:user).permit(:user_ids)
      params.require(:courses_users).permit(:user_ids)
    end

end
