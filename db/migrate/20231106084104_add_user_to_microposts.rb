class AddUserToMicroposts < ActiveRecord::Migration[7.0]
  def change
    add_reference :microposts, :user, foreign_key: true
  end
end
