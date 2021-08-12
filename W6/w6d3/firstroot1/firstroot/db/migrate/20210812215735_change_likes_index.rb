class ChangeLikesIndex < ActiveRecord::Migration[5.2]
  def change
    remove_index :likes, [:user_id, :likeable_id]
    remove_index :likes, [:user_id, :likeable_type]

    add_index :likes, [:user_id, :likeable_id, :likeable_type], unique: true
    add_index :likes, [:user_id, :likeable_type, :likeable_id], unique: true
  end
end
