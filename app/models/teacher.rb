class Teacher < ApplicationRecord
  has_many :courses

  scope :active, ->{ where.not(active: true)}
  scope :inactive, ->{ where(active: nil)}
end
