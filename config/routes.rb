Rails.application.routes.draw do
  resources :jourferies
  resources :intemperies
  resources :prestations
  resources :machines
  resources :clients
  resources :employeurs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
