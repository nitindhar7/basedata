class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :mpn,          :null => true
      t.float :price,         :null => true
      t.string :upc,          :null => true
      t.string :seller,       :null => true
      t.string :condition,    :null => true
      t.string :ean,          :null => true
      t.string :model_number, :null => true
      t.string :brand,        :null => true
      t.string :type,         :null => true
      t.string :url,          :null => true
      t.string :image_url,    :null => true
      t.string :country,      :null => true
      t.date :expiration,     :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
