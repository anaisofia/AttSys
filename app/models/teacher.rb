class Teacher < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_many :courses

  scope :active, ->{ where.not(active: true)}
  scope :inactive, ->{ where(active: nil)}
end
