class AddNomchefToPrestations < ActiveRecord::Migration[5.2]
  def change
    add_column :prestations, :Nomchef, :string
  end
end
