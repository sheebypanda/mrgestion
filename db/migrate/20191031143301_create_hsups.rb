class CreateHsups < ActiveRecord::Migration[5.2]
  def change
    create_table :hsups do |t|
      t.float :qte
      t.date :date
      t.references :prestation, foreign_key: true

      t.timestamps
    end
  end
end
