class RoutesController < ApplicationController
  def show
    # .includes precarga los viajes y entregas en una sola consulta a la BD (Optimización N+1)
    @route = Route.includes(trips: :deliveries).find(params[:id])

    # Devolvemos un JSON anidado con toda la estructura requerida
    render json: @route.as_json(
      include: {
        trips: {
          include: :deliveries
        }
      }
    ), status: :ok
    
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Ruta no encontrada' }, status: :not_found
  end
end