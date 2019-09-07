class AddTarifToPrestations < ActiveRecord::Migration[5.2]
  def change
    add_column :prestations, :tarif, :float
  end
end
