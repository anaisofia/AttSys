json.extract! course, :id, :title, :start, :finish, :user_id, :created_at, :updated_at
json.url course_url(course, format: :json)
