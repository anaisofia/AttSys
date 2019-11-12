class CoursesUsersController < InheritedResources::Base

  private

    def courses_user_params
      params.require(:courses_user).permit(:course_id, :user_id)
    end

end
