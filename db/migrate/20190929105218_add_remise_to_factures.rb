class AddRemiseToFactures < ActiveRecord::Migration[5.2]
  def change
    add_column :factures, :remise, :float
  end
end
