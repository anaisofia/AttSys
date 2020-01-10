class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :courses, :join_table => "courses_users"
end
