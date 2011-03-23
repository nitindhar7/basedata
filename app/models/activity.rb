class Activity < ActiveRecord::Base
  belongs_to :account
  belongs_to :collection
  
  cattr_reader :per_page
  @@per_page = 9
end