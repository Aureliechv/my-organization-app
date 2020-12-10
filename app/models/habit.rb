class Habit < ApplicationRecord
  belongs_to :user

  validates :title, :days, presence: true
end
