class Course < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  after_create :create_lessons, only: [:create]

  has_and_belongs_to_many :users, :join_table => "courses_users"
  belongs_to :level
  belongs_to :teacher
  has_many :lessons, dependent: :destroy
  accepts_nested_attributes_for :lessons

  scope :active, ->{ where.not(active: nil)}
  scope :inactive, ->{ where(active: nil)}

  def create_lessons
    27.times do |l|
      self.lessons.build(title: "Lesson N°: #{l+1}", status_id: 6)
    end
  end

  #Counts & show in the dashboard graph the courses created from the beggining of times, it needs to be updated to show whatever info we need to display using a chart
  def self.in_progress
    group_by_day(:created_at).count
  end
end
