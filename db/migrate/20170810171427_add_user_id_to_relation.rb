class AddUserIdToRelation < ActiveRecord::Migration[5.1]
  def change
    add_column :relations, :status, :string
    add_column :relations, :user_id, :int
    add_column :relations, :tartget_id, :int
  end
end
