json.extract! employeur, :id, :nom, :siret, :adresse, :cp, :ville, :tel, :email, :email2, :created_at, :updated_at
json.url employeur_url(employeur, format: :json)
