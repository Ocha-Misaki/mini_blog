class HangeColumnToUser < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :name, :string, null: true
    change_column :users, :profile, :text, null: true
  end
end
