ActiveAdmin.register Course do

  permit_params :title, :start, :finish, :active, :user_ids, :level_id,  :teacher_id, :users, :courses_users, :hours, user_ids:[], lesson_ids:[], users_ids:[],
  lesson_attributes: [:title, :start, :end, :course_id, :status_id]

  scope :all
  scope :active
  scope :inactive

  index do
    column :id
    column :active
    column :title
    column :start
    column :finish
    column :users, multiple: true
    column :level
    column :teacher
    actions
  end

  form do |f|
    inputs "Course Details" do
      input :title
      input :level
      f.input :start, as: :date_time_picker,
      picker_options: {
        dayOfWeekStart: 1,
        disabledWeekDays: [0],
        format:'d.m.Y H:i',
        allow_times: [
          '07:00','07:30','08:00','08:30','09:00','09:30','10:00','10:30','11:00','11:30','12:00','12:30','13:00','13:30','14:00','14:30','15:00','15:30','16:00','16:30','17:00','17:30','18:00','18:30','19:00', '19:30','20:00','20:30','21:00','21:30','22:00'
        ],
      }
      f.input :finish, as: :date_time_picker,
      picker_options: {
        dayOfWeekStart: 1,
        disabledWeekDays: [0],
        format:'d.m.Y H:i',
        allow_times: [
          '07:00','07:30','08:00','08:30','09:00','09:30','10:00','10:30','11:00','11:30','12:00','12:30','13:00','13:30','14:00','14:30','15:00','15:30','16:00','16:30','17:00','17:30','18:00','18:30','19:00', '19:30','20:00','20:30','21:00','21:30','22:00'
        ],
      }
      input :hours
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

  sidebar "Lessons", only: :show do
    attributes_table do
      row 'title' do |n|
        raw(n.lessons.map{ |n| raw(link_to(n.title, admin_lesson_path(n))) }.join("<br />"))
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
