class AddVideoLinkToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :video_link, :string
    add_column :trips, :visible_scope, :string
  end
end
