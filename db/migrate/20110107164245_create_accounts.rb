class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :first_name,     :null => false, :limit => 25
      t.string :last_name,      :null => false, :limit => 50
      t.string :email,          :null => false, :limit => 100
      t.string :password,       :null => false, :limit => 50
      t.string :company,                        :limit => 50
      t.string :phone,          :null => false, :limit => 14
      t.string :billing_name,   :null => false, :limit => 50
      t.string :billing_street, :null => false, :limit => 50
      t.string :billing_city,   :null => false, :limit => 50
      t.string :billing_state,  :null => false, :limit => 2
      t.string :billing_zip,    :null => false, :limit => 10

      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end