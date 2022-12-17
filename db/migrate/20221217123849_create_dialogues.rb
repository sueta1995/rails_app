class CreateDialogues < ActiveRecord::Migration[7.0]
  def change
    create_table :dialogues do |t|
      t.integer :first_user_id
      t.integer :second_user_id

      t.timestamps
    end
  end
end
