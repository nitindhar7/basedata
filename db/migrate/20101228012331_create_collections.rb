class CreateCollections < ActiveRecord::Migration
  def self.up
    create_table :collections do |t|
      t.string :name,     :null => false, :limit => 50
      t.integer :user_id, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :collections
  end
end
