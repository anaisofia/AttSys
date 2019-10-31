class LevelsController < InheritedResources::Base
  include ActiveModel::MassAssignmentSecurity

def create
end

  private

    def level_params
      sanitize_for_mass_assignment(params.require(:level).permit(:title, :code, :description))
    end

end
