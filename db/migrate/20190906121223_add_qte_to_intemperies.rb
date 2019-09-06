class AddQteToIntemperies < ActiveRecord::Migration[5.2]
  def change
    add_column :intemperies, :qte, :float
  end
end
