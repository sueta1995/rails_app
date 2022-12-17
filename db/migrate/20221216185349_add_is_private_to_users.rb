class AddIsPrivateToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_private, :boolean
  end
end
