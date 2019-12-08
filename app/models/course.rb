class Course < ApplicationRecord
  has_and_belongs_to_many :users, :join_table => "courses_users"
  belongs_to :level
  belongs_to :teacher
  has_many :lessons

  scope :active, ->{ where.not(active: nil)}
  scope :inactive, ->{ where(active: nil)}

  #Revisar y modificar, esto es solo un ejemplo
  def self.in_progress
    group_by_day(:created_at).count
  end
end
