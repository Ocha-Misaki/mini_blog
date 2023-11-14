class ChangeColumnToRelationships < ActiveRecord::Migration[7.0]
  def change
    change_column :follower_id, :integer, null: false
    change_column :followed_id, :integer, null: false
  end
end
