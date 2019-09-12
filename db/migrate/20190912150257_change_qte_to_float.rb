class ChangeQteToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :facture_lignes, :qte, :float
  end
end
