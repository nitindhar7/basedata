class ChangeProductColumnOrder < ActiveRecord::Migration
  def self.up
    remove_column :products, :url
    remove_column :products, :seller
    remove_column :products, :condition
    remove_column :products, :type
    remove_column :products, :image_url
    remove_column :products, :mpn
    remove_column :products, :upc
    remove_column :products, :ean
    remove_column :products, :model_number
    remove_column :products, :price
    remove_column :products, :country
    remove_column :products, :expiration
    remove_column :products, :brand
    remove_column :products, :created_at
    remove_column :products, :updated_at
    add_column    :products, :mpn,          :string
    add_column    :products, :price,        :float
    add_column    :products, :upc,          :string
    add_column    :products, :seller,       :string
    add_column    :products, :condition,    :string
    add_column    :products, :ean,          :string
    add_column    :products, :model_number, :string
    add_column    :products, :brand,        :string
    add_column    :products, :type,         :string
    add_column    :products, :url,          :string
    add_column    :products, :image_url,    :string
    add_column    :products, :country,      :string
    add_column    :products, :expiration,   :date
    add_column    :products, :created_at,   :datetime
    add_column    :products, :updated_at,   :datetime
  end

  def self.down
  end
end
