class Collection < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :account_id, :case_sensitive => false, :message => ': Name in use'
  
  belongs_to :account
  has_many :products
  has_many :activities
end