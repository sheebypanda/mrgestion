Rails.application.routes.draw do
  resources :jourferies, :intemperies, :prestations, :machines, :clients, :employeurs

  root 'prestations#calendrier'

  get '/calendrier', to: 'prestations#calendrier'
  get '/factures', to: 'prestations#facture'
end
