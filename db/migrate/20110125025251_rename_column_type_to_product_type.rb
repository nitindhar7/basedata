class RenameColumnTypeToProductType < ActiveRecord::Migration
  def self.up
    rename_column :products, :type, :product_type 
  end

  def self.down
    rename_column :products, :product_type, :type
  end
end
