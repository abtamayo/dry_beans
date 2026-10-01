class Trip < ApplicationRecord
  belongs_to :route
  has_many :deliveries, dependent: :destroy
end