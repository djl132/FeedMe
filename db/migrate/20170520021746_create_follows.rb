class CreateFollows < ActiveRecord::Migration[5.0]
  def change
    create_table :follows do |t|
      t.integer :target_id, index: true
      t.integer :user_id, index: true

      t.timestamps null: false
    end

    # cannot have a duplicate row with smae  user and targetted item.
    add_index :follows, [:target_id, :user_id], unique: true
  end


end
