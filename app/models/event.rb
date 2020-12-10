class Event < ApplicationRecord
  belongs_to :user

  validates :start_date, :end_date, :name, :description, presence: true
end
