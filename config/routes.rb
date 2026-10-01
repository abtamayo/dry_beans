Rails.application.routes.draw do
  # Exponemos solo el endpoint 'show' para rutas (GET /routes/:id)
  resources :routes, only: [:show]
  
  # Exponemos solo el endpoint 'create' para entregas (POST /deliveries)
  resources :deliveries, only: [:create]
end