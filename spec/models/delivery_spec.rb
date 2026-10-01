require 'rails_helper'

RSpec.describe Delivery, type: :model do
  # Preparamos datos de prueba básicos
  let(:route) { Route.create!(name: "Ruta Oriente", status: "active") }
  let(:trip) { Trip.create!(route: route, scheduled_date: Date.today, status: "pending") }

  it "es válido con todos los atributos obligatorios" do
    delivery = Delivery.new(
      trip: trip,
      action_type: "pickup",
      status: "pending",
      address: "Av. Apoquindo, Las Condes",
      recipient_name: "Diego Carvajal"
    )
    expect(delivery).to be_valid
  end

  it "es inválido si falta la dirección" do
    delivery = Delivery.new(
      trip: trip,
      action_type: "pickup",
      status: "pending"
    )
    expect(delivery).not_to be_valid
  end
end