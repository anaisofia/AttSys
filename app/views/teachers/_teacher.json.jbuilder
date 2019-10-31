json.extract! teacher, :id, :name, :email, :password, :address, :phone, :summary, :birthdate, :nationality, :active, :created_at, :updated_at
json.url teacher_url(teacher, format: :json)
