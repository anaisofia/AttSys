ActiveAdmin.register User do
  menu label: "Students"

  permit_params :name, :email, :password

  form do |f|
    inputs "Create New Student" do
      input :name
      input :email
      input :password
    end
    actions
  end

  controller do
    def update
      if (params[:user][:password].blank? && params[:user][:password_confirmation].blank?)
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      super
    end
  end

end
