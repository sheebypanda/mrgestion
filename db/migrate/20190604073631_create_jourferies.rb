class CreateJourferies < ActiveRecord::Migration[5.2]
  def change
    create_table :jourferies do |t|
      t.date :date

      t.timestamps
    end
  end
end
