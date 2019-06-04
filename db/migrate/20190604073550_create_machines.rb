class CreateMachines < ActiveRecord::Migration[5.2]
  def change
    create_table :machines do |t|
      t.string :marque
      t.string :modele
      t.string :poids
      t.string :idlocatier

      t.timestamps
    end
  end
end
