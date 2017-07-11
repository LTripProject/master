class CreateUserNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :user_notifications do |t|
      
      t.references :notification, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :sender_id

      t.timestamps null: false
    end
  end
end
