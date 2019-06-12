class CreateFactureLignes < ActiveRecord::Migration[5.2]
  def change
    create_table :facture_lignes do |t|
      t.references :prestation, foreign_key: true
      t.references :facture, foreign_key: true
      t.date :debut
      t.date :fin
      t.integer :qte
      t.float :km
      t.float :hsup
      t.float :montant

      t.timestamps
    end
  end
end
