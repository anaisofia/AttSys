class Course < ApplicationRecord
  belongs_to :user
  belongs_to :level
  belongs_to :teacher

  scope :active, ->{ where.not(active: nil)}
  scope :inactive, ->{ where(active: nil)}
end
