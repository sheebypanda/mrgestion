class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :nom
      t.string :siret
      t.string :adresse
      t.string :cp
      t.string :ville

      t.timestamps
    end
  end
end
