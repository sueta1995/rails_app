class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.integer :dialogue_id
      t.integer :sender_id
      t.text :body

      t.timestamps
    end
  end
end
