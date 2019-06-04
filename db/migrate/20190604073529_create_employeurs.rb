class CreateEmployeurs < ActiveRecord::Migration[5.2]
  def change
    create_table :employeurs do |t|
      t.string :nom
      t.string :siret
      t.string :adresse
      t.string :cp
      t.string :ville
      t.string :tel
      t.string :email
      t.string :email2

      t.timestamps
    end
  end
end
