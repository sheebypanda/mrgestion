class CreatePrestations < ActiveRecord::Migration[5.2]
  def change
    create_table :prestations do |t|
      t.references :employeur, foreign_key: true
      t.references :client, foreign_key: true
      t.references :machine, foreign_key: true
      t.date :debut
      t.date :fin
      t.integer :nbjour
      t.integer :hsup
      t.string :adresse
      t.string :ville

      t.timestamps
    end
  end
end
