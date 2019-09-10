Rails.application.routes.draw do
  devise_for :users
  
  resources :jourferies, :intemperies, :prestations, :machines, :clients, :employeurs
  resources :factures, :facture_lignes

  root 'prestations#calendrier'

  get '/calendrier', to: 'prestations#calendrier'
  get '/factures', to: 'prestations#facture'
end
