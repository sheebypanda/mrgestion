class AddBondecommandeToPrestations < ActiveRecord::Migration[5.2]
  def change
    add_column :prestations, :bondecommande, :string
  end
end
