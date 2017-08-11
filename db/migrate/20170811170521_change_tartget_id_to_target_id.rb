class ChangeTartgetIdToTargetId < ActiveRecord::Migration[5.1]
  def change
    rename_column :relations, :tartget_id, :target_id
  end
end
