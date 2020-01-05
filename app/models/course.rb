class Course < ApplicationRecord
  after_create :create_lessons, only: [:create]

  has_and_belongs_to_many :users, :join_table => "courses_users"
  belongs_to :level
  belongs_to :teacher
  has_many :lessons
  accepts_nested_attributes_for :lessons

  scope :active, ->{ where.not(active: nil)}
  scope :inactive, ->{ where(active: nil)}

  def create_lessons
    27.times do |l|
      self.lessons.build(title: "Lesson N°: #{l+1}", status_id: 6)
    end
  end

  #Revisar y modificar, esto es solo un ejemplo
  def self.in_progress
    group_by_day(:created_at).count
  end
end
