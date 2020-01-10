class Lesson < ApplicationRecord
  belongs_to :course
  validates :status, presence: true, uniqueness: true

  belongs_to :status

end
