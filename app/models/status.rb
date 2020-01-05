class Status < ApplicationRecord
  has_many :lessons

  def self.colors
    [
      "#DD2900"
    ]
  end
end
