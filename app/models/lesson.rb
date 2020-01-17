class Lesson < ApplicationRecord
  belongs_to :course
  validates :status, presence: true

  belongs_to :status

end
