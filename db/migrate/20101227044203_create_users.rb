class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string  :name,     :null => false, :limit => 50
      t.string  :email,    :null => false, :limit => 100
      t.string  :password, :null => false, :limit => 50
      t.integer :autosave, :null => false, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
