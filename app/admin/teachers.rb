ActiveAdmin.register Teacher do
  permit_params :name, :email, :password, :address, :phone, :summary, :active, :birthdate, :nationality

  index do
    column :id
    column :name
    column :email
    column :nationality
    column :address
    column :teacher_since do |teacher|
      time_ago_in_words(teacher.created_at)
    end
    actions
  end

  form do |f|
    inputs "Create New Teacher" do
      input :name
      input :email
      input :password
      input :address
      input :phone
      input :summary
      input :birthdate
      input :nationality
      input :active
    end
    actions
  end

  controller do
    def update
      if (params[:teacher][:password].blank? && params[:teacher][:password_confirmation].blank?)
        params[:teacher].delete("password")
        params[:teacher].delete("password_confirmation")
      end
      super
    end
  end

  scope :all
  scope :active
  scope :inactive

# Marcar profe como activo
  action_item :activate, only: :show do
    link_to "Active Teacher", activate_admin_teacher_path(teacher), method: :put if !teacher.active?
  end

# Marcar profe como inactivo
  action_item :activate, only: :show do
    link_to "Inactive Teacher", deactivate_admin_teacher_path(teacher), method: :put if teacher.active?
  end

# ActionItem para marcar profe como activo
  member_action :activate, method: :put do
    teacher = Teacher.find(params[:id])
    teacher.update(active: true)
    redirect_to admin_teacher_path(teacher)
  end

# ActionItem para dar marcar profe como inactivo
  member_action :deactivate, method: :put do
    teacher = Teacher.find(params[:id])
    teacher.update(active: nil)
    redirect_to admin_teacher_path(teacher)
  end

end
