class AddCollectionIdColumn < ActiveRecord::Migration
  def self.up
    add_column :products, :collection_id, :integer
  end

  def self.down
    remove_column :products, :collection_id
  end
end
