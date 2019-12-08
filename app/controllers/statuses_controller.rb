class StatusesController < InheritedResources::Base
  include ActiveModel::MassAssignmentSecurity
  protect_from_forgery

  private

    def status_params
      sanitize_for_mass_assignment(params.require(:status).permit(:name))
    end

end
