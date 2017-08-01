class AddFacebookAvatarToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :facebook_avatar, :string
  end
end
