class UsersController < InheritedResources::Base
  protect_from_forgery

  private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

end
