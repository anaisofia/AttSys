class User < ApplicationRecord
  has_and_belongs_to_many :courses, :join_table => "courses_users"
end
