class FixProductPrice < ActiveRecord::Migration
  def self.up
    change_column :products, :price, :decimal, :null => false, :default => 0, :precision => 8, :scale => 2
  end

  def self.down
    change_column :products, :price, :decimal, :null => false, :default => 0, :precision => 2, :scale => 0
  end
end
