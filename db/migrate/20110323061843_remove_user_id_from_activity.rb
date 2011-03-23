class RemoveUserIdFromActivity < ActiveRecord::Migration
  def self.up
    remove_column :activities, :user_id
  end

  def self.down
  end
end