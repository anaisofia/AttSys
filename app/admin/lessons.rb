ActiveAdmin.register Lesson do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :start, :end, :course_id, :status_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :start, :end, :course_id, :status_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    inputs "Lesson Details" do
      input :course
      input :title
      input :status
      f.input :start, as: :datepicker,
      datepicker_options: {
        firstDay: 1,
        showButtonPanel: true,
        changeMonth: true,
        changeYear: true,
        dateFormat: "DD, d MM, yy"
      }
      f.input :end, as: :datepicker,
      datepicker_options: {
        firstDay: 1,
        showButtonPanel: true,
        changeMonth: true,
        changeYear: true,
        dateFormat: "DD, d MM, yy"
      }
    end
    actions
  end

end
