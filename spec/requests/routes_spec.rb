require 'rails_helper'

RSpec.describe "Routes API", type: :request do
  # Preparamos la base de datos de prueba con una ruta, un viaje y una entrega
  let(:route) { Route.create!(name: "Ruta Norte", status: "active") }
  let!(:trip) { Trip.create!(route: route, scheduled_date: Date.today, status: "pending") }
  let!(:delivery) { Delivery.create!(trip: trip, action_type: "pickup", status: "pending", address: "Av. Kennedy 5413", recipient_name: "Cliente Prueba") }

  describe "GET /routes/:id" do
    it "devuelve la ruta exitosamente (status 200) incluyendo sus viajes y entregas" do
      # Hacemos la petición a la API
      get "/routes/#{route.id}"

      # Verificamos que la respuesta sea exitosa
      expect(response).to have_http_status(:ok)
      
      # Verificamos que el JSON contenga la estructura anidada correcta
      json_response = JSON.parse(response.body)
      expect(json_response["name"]).to eq("Ruta Norte")
      expect(json_response["trips"]).not_to be_empty
      expect(json_response["trips"].first["deliveries"]).not_to be_empty
    end
  end
end