class AddAccountToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :account_id, :integer, :null => false
  end

  def self.down
    remove_column :users, :account_id
  end
end
