class AddRoleToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :role, :string, :limit => 10, :null => false, :default => "member"
  end

  def self.down
    remove_column :users, :role
  end
end
