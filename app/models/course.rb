class Course < ApplicationRecord
  belongs_to :user
  belongs_to :level
  belongs_to :teacher

  scope :active, ->{ where.not(active: nil)}
  scope :inactive, ->{ where(active: nil)}

  #Revisar y modificar, esto es solo un ejemplo
  def self.in_progress
    group_by_day(:created_at).count
  end
end
