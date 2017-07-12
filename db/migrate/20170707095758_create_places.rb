class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
    t.string :name
      t.string :location_id
      t.decimal :rating
      t.decimal :latitude
      t.decimal :longitude
      t.references :region, index: true

      t.timestamps
    end
  end
end
