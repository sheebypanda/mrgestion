Rails.application.routes.draw do

  devise_for :users, :skip => [:registrations]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end

  resources :jourferies, :intemperies, :prestations, :machines, :clients, :employeurs
  resources :factures, :facture_lignes

  root 'prestations#calendrier'

  get '/calendrier', to: 'prestations#calendrier'
  get '/factures', to: 'prestations#facture'
end
