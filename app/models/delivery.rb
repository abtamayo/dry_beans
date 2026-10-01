class Delivery < ApplicationRecord
  belongs_to :trip

  # Definimos enums para manejar los estados como enteros en BD pero como texto en el código
  enum action_type: { pickup: 0, dropoff: 1 }
  enum status: { pending: 0, completed: 1, failed: 2 }

  validates :action_type, :status, :address, presence: true
end