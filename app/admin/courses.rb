ActiveAdmin.register Course do
  permit_params :title, :start, :finish, :active, :user_id, :level_id, :teacher_id

  scope :all
  scope :active
  scope :inactive

  form do |f|
    inputs "Course Details" do
      input :user
      input :title
      input :level
      input :teacher
    end
    actions
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
