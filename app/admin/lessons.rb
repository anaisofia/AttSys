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
      f.input :start, as: :date_time_picker, input_html: {autocomplete: :off},
      picker_options: {
        dayOfWeekStart: 1,
        disabledWeekDays: [0],
        format:'d.m.Y H:i',
        allow_times: [
          '07:00','07:30','08:00','08:30','09:00','09:30','10:00','10:30','11:00','11:30','12:00','12:30','13:00','13:30','14:00','14:30','15:00','15:30','16:00','16:30','17:00','17:30','18:00','18:30','19:00', '19:30','20:00','20:30','21:00','21:30','22:00'
        ],
      }
      f.input :end, as: :date_time_picker, input_html: {autocomplete: :off},
      picker_options: {
        dayOfWeekStart: 1,
        disabledWeekDays: [0],
        format:'d.m.Y H:i',
        allow_times: [
          '07:00','07:30','08:00','08:30','09:00','09:30','10:00','10:30','11:00','11:30','12:00','12:30','13:00','13:30','14:00','14:30','15:00','15:30','16:00','16:30','17:00','17:30','18:00','18:30','19:00', '19:30','20:00','20:30','21:00','21:30','22:00'
        ],
      }
    end
    actions
  end

end
