class CreateBannedUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :banned_users do |t|
      t.integer :user_id
      t.text :reason

      t.timestamps
    end
  end
end
