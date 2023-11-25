class AddIndexMicropostToLikes < ActiveRecord::Migration[7.0]
  def change
    add_index :likes, :micropost_id
  end
end
