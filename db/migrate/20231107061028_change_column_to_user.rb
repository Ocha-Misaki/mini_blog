class ChangeColumnToUser < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :name, :string, null: false
    change_column :users, :profile, :text, null: false
  end
end
