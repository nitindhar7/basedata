class RemoveNullFromProductExpiryDate < ActiveRecord::Migration
  def self.up
    change_column :products, :expiration, :date, :null => true
  end

  def self.down
    change_column :products, :expiration, :date, :null => false
  end
end
