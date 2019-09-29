class AddMailToPrestations < ActiveRecord::Migration[5.2]
  def change
    add_column :prestations, :mail, :string
  end
end
