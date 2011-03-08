class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.integer :user_id,       :null => false
      t.integer :collection_id, :null => false
      t.string :action_taken,   :null => false 
      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end
end
