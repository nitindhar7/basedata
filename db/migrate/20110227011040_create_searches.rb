class CreateSearches < ActiveRecord::Migration
  def self.up
    create_table :searches do |t|
      t.string :query, :null => false, :limit => 200
      t.integer :user_id, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :searches
  end
end
