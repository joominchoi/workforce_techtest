class Organisation < ApplicationRecord
  has_many :users

  validates :name, presence: true, uniqueness: true
  validates :hourly_rate, numericality: { greater_than_or_equal_to: 0 }
end