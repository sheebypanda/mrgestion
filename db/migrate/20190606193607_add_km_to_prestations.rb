class AddKmToPrestations < ActiveRecord::Migration[5.2]
  def change
    add_column :prestations, :km, :integer
  end
end
