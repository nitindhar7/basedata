class AddCurrencyToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :currency, :string, :default => 'usd', :limit => 3, :null => false
  end

  def self.down
    remove_column :products, :currency
  end
end
