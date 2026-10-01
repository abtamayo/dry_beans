require 'rails_helper'

RSpec.describe "Deliveries API", type: :request do
  let(:route) { Route.create!(name: "Ruta Central", status: "active") }
  let(:trip) { Trip.create!(route: route, scheduled_date: Date.today, status: "pending") }

  describe "POST /deliveries" do
    context "con parámetros válidos" do
      let(:valid_attributes) do
        {
          delivery: {
            trip_id: trip.id,
            action_type: "dropoff",
            status: "completed",
            address: "Providencia 123",
            recipient_name: "Alejandra Tamayo"
          }
        }
      end

      it "crea una nueva entrega y retorna status 201 (Created)" do
        expect {
          post '/deliveries', params: valid_attributes
        }.to change(Delivery, :count).by(1)

        expect(response).to have_http_status(:created)
      end
    end
  end
end