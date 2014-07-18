class AddFriends < ActiveRecord::Migration
  def change
    add_column :animals, :friends, :integer
  end
end
