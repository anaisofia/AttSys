class TeachersController < InheritedResources::Base
  protect_from_forgery

  private

    def teacher_params
      params.require(:teacher).permit(:name, :email, :password, :address, :phone, :summary, :birthdate, :nationality, :active)
    end

end
