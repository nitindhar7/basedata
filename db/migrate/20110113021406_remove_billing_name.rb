class RemoveBillingName < ActiveRecord::Migration
  def self.up
    remove_column :accounts, :billing_name
  end

  def self.down
    add_column :accounts, :billing_name, :limit => 50, :null => false
  end
end
