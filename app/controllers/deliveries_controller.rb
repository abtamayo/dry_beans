class DeliveriesController < ApplicationController
  def create
    @delivery = Delivery.new(delivery_params)

    if @delivery.save
      render json: @delivery, status: :created
    else
      # Si falla una validación (ej. falta la dirección), devolvemos el error exacto
      render json: { errors: @delivery.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  # Strong Parameters: Filtro de seguridad
  def delivery_params
    params.require(:delivery).permit(:trip_id, :action_type, :status, :recipient_name, :address, :resolved_at)
  end
end