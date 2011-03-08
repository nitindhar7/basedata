class ActivityCollectionIdNameNull < ActiveRecord::Migration
  def self.up
    change_column :activities, :user_id, :integer, :null => false
    change_column :activities, :collection_id, :integer, :null => true
    change_column :activities, :user_name, :string, :null => false
    change_column :activities, :collection_name, :string, :null => true
  end

  def self.down
    change_column :activities, :user_id, :integer, :null => false
    change_column :activities, :collection_id, :integer, :null => false
    change_column :activities, :user_name, :string, :null => false
    change_column :activities, :collection_name, :string, :null => false
  end
end
