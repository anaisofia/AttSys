class LessonsController < InheritedResources::Base

  private

    def lesson_params
      params.require(:lesson).permit(:title, :start, :end, :course_id, :status_id)
    end

end
