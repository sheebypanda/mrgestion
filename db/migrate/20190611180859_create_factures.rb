class CreateFactures < ActiveRecord::Migration[5.2]
  def change
    create_table :factures do |t|
      t.references :employeur, foreign_key: true
      t.integer :numero
      t.date :debut
      t.date :fin

      t.timestamps
    end
  end
end
