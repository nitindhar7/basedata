class ConvertPriceToFloat < ActiveRecord::Migration
  def self.up
    change_column :products, :price, :decimal, :null => false, :default => 0, :precision => 2
  end

  def self.down
    change_column :products, :price, :float
  end
end
