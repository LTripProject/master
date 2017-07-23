class CreateInviteTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :invite_tokens do |t|
      t.references :user, foreign_key: true
      t.references :trip, foreign_key: true
      t.string :token

      t.timestamps
    end
  end
end
