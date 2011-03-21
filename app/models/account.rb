class Account < ActiveRecord::Base
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :password
  validates_length_of :first_name, :in => 1..25
  validates_length_of :last_name, :in => 1..25
  validates_length_of :email, :in => 1..100
  validates_length_of :password, :in => 1..50
  validates_uniqueness_of :email, :case_sensitive => false
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  
=begin
USERS
  validates_presence_of :name, :message => ': Please enter your name'
  validates_presence_of :email, :message => ': Please enter your email'
  validates_presence_of :password, :message => ': Please enter a password'
  validates_length_of :name, :in => 1..50, :message => ': Name is too short or too long'
  validates_length_of :email, :in => 6..100, :message => ': Email is too short or too long'
  validates_length_of :password, :in => 6..50, :message => ': Password is too short or too long'
  validates_uniqueness_of :email, :case_sensitive => false, :message => ': Email in use'
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => ": Invalid email. Try removing special characters"
  
  has_many :collections
  has_many :activities
  belongs_to :account
=end
  
  has_many :users
  
  attr_accessor :confirm_password
  
  STATES = ['AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'DC', 'FL', 'GA', 'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV', 'WI', 'WY']
end