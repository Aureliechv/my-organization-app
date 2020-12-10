class Task < ApplicationRecord
  belongs_to :user

  validates :date, :content, :name, presence: true
end
