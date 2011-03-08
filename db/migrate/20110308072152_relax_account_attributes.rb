class RelaxAccountAttributes < ActiveRecord::Migration
  def self.up
    change_column :accounts, :phone, :string, :limit => 14, :null => true
    change_column :accounts, :billing_street, :string, :limit => 50, :null => true
    change_column :accounts, :billing_city, :string, :limit => 50, :null => true
    change_column :accounts, :billing_state, :string, :limit => 2, :null => true
    change_column :accounts, :billing_zip, :string, :limit => 10, :null => true
  end

  def self.down
    change_column :accounts, :phone, :string, :limit => 14, :null => false
    change_column :accounts, :billing_street, :string, :limit => 50, :null => false
    change_column :accounts, :billing_city, :string, :limit => 50, :null => false
    change_column :accounts, :billing_state, :string, :limit => 2, :null => false
    change_column :accounts, :billing_zip, :string, :limit => 10, :null => false
  end
end
