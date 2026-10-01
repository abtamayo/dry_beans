class Route < ApplicationRecord
  has_many :trips, dependent: :destroy
  validates :name, presence: true
end