class Update < ActiveRecord::Migration
  def self.up
    change_column :accounts, :last_name, :string, :null => false, :limit => 25
  end

  def self.down
    change_column :accounts, :last_name, :string, :null => false, :limit => 50
  end
end
