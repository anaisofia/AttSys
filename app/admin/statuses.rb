ActiveAdmin.register Status do

  permit_params :name, :color

  form do |f|
    inputs "Available Statuses" do
      input :name
      f.input :color, as: :color_picker
    end
    f.actions
  end

  index do
    column :id
    column :name
    column :color, as: :color
  actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name
  #
  # or
  #
  # permit_params do
  #   permitted = [:name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
