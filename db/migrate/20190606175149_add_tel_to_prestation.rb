class AddTelToPrestation < ActiveRecord::Migration[5.2]
  def change
    add_column :prestations, :tel, :string
  end
end
