class AddAccountIdActivities < ActiveRecord::Migration
  def self.up
    add_column :activities, :account_id, :integer, :null => false
  end

  def self.down
    remove_column :activities, :account_id
  end
end
