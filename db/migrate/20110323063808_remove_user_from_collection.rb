class RemoveUserFromCollection < ActiveRecord::Migration
  def self.up
    remove_column :collections, :user_id
  end

  def self.down
  end
end
