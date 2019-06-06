class RenameNomchefTonomchef < ActiveRecord::Migration[5.2]
  def change
      rename_column :prestations, :Nomchef, :nomchef
  end
end
