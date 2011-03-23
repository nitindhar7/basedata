class RemoveUserIdFromSearches < ActiveRecord::Migration
  def self.up
    remove_column :searches, :user_id
    add_column :searches, :account_id, :integer, :null => false
  end

  def self.down
  end
end
