class CourseUsersController < InheritedResources::Base

  private

    def course_user_params
      params.require(:course_user).permit(:user_ids, :course_id)
    end

end
