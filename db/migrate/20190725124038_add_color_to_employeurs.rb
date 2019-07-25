class AddColorToEmployeurs < ActiveRecord::Migration[5.2]
  def change
    add_column :employeurs, :color, :string
  end
end
