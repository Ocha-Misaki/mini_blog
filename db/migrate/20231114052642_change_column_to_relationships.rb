class ChangeColumnToRelationships < ActiveRecord::Migration[7.0]
  def change
    change_column :relationships, :follower_id, :integer, null: false
    change_column :relationships, :followed_id, :integer, null: false
  end
end
