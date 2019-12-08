json.extract! lesson, :id, :title, :total, :start, :end, :course_id, :status_id, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
