class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true, index: false
      t.references :micropost, null: false, foreign_key: true
      t.timestamps
    end
    add_index :likes, %i[user_id micropost_id], unique: true
  end
end
