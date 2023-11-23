class AddIndexToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :user_id, :integer
    add_column :likes, :micropost_id, :integer
    add_index :likes, %i[user_id micropost_id], unique: true
  end
end
