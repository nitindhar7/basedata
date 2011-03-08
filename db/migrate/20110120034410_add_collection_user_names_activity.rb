class AddCollectionUserNamesActivity < ActiveRecord::Migration
  def self.up
    add_column :activities, :user_name, :string, :limit => 50, :null => false
    add_column :activities, :collection_name, :string, :limit => 50, :null => false
  end

  def self.down
    remove_column :activities, :user_name
    remove_column :activities, :collection_name
  end
end
