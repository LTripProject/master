class CreateUserTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :user_trips do |t|
      t.references :user, index: true, foreign_key: true
      t.references :trip, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
