json.extract! client, :id, :nom, :siret, :adresse, :cp, :ville, :created_at, :updated_at
json.url client_url(client, format: :json)
