ActiveAdmin.register Course do
  permit_params :title, :start, :finish, :active, :user_ids, :level_id,  :teacher_id, :courses_users, user_ids:[]

  scope :all
  scope :active
  scope :inactive

  form do |f|
    inputs "Course Details" do
      input :title
      input :level
      f.input :start, as: :datepicker,
      datepicker_options: {
        firstDay: 1,
        showButtonPanel: true,
        changeMonth: true,
        changeYear: true,
        dateFormat: "DD, d MM, yy"
      }
      f.input :finish, as: :datepicker,
      datepicker_options: {
        firstDay: 1,
        showButtonPanel: true,
        changeMonth: true,
        changeYear: true,
        dateFormat: "DD, d MM, yy"
      }
      input :users
      input :teacher
    end
    actions
  end

  show do
    attributes_table do
      row :title
      row :level
      row :start
      row :finish
      row :active
    end
    active_admin_comments
  end

  sidebar "Students", only: :show do
    attributes_table do
      row 'Names' do |n|
        raw(n.users.map{ |n| raw(link_to(n.name, admin_user_path(n))) }.join("<br />"))
      end
      row :teacher
    end
  end

  # Marcar curso como activo
  action_item :activate, only: :show do
    link_to "Mark as Active", activate_admin_course_path(course), method: :put if !course.active?
  end

  # Marcar curso como inactivo
  action_item :activate, only: :show do
    link_to "Mark as Inactive", deactivate_admin_course_path(course), method: :put if course.active?
  end

  # ActionItem para marcar curso como activo
  member_action :activate, method: :put do
    course = Course.find(params[:id])
    course.update(active: Time.zone.now)
    redirect_to admin_course_path(course)
  end

  # ActionItem para dar marcar curso como inactivo
  member_action :deactivate, method: :put do
    course = Course.find(params[:id])
    course.update(active: nil)
    redirect_to admin_course_path(course)
  end

  # filter :level, as: :select

end
