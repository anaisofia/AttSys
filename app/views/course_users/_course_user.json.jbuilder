json.extract! course_user, :id, :user_id, :course_id, :created_at, :updated_at
json.url course_user_url(course_user, format: :json)
