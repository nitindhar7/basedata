class Account < ActiveRecord::Base
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :password
  validates_presence_of :phone
  validates_presence_of :billing_street
  validates_presence_of :billing_city
  validates_presence_of :billing_state
  validates_presence_of :billing_zip
  validates_length_of :first_name, :in => 1..25
  validates_length_of :last_name, :in => 1..25
  validates_length_of :email, :in => 1..100
  validates_length_of :password, :in => 1..50
  validates_length_of :company, :in => 1..50
  validates_length_of :phone, :in => 10..14
  validates_length_of :billing_street, :in => 1..50
  validates_length_of :billing_city, :in => 1..50
  validates_length_of :billing_state, :in => 1..2
  validates_length_of :billing_zip, :in => 1..10
  validates_uniqueness_of :email, :case_sensitive => false
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  
  has_many :users
  
  attr_accessor :confirm_password
  
  STATES = ['AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'DC', 'FL', 'GA', 'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV', 'WI', 'WY']
end