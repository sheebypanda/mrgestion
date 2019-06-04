json.extract! prestation, :id, :employeur_id, :client_id, :machine_id, :debut, :fin, :nbjour, :hsup, :adresse, :ville, :created_at, :updated_at
json.url prestation_url(prestation, format: :json)
