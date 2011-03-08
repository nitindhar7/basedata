class AddAccountIdCollection < ActiveRecord::Migration
  def self.up
    add_column :collections, :account_id, :integer, :null => false
  end

  def self.down
    remove_column :collections, :account_id
  end
end
