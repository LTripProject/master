class CreateRegions < ActiveRecord::Migration[5.1]
  def change
    create_table :regions do |t|
      t.string :name
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps null: false
      t.timestamps
    end
  end
end
