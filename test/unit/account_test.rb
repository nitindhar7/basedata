require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  
  test "name" do
    @account = Account.create(:first_name => "John", :last_name => "Doe", :email => "jdoe@basedataapp.com", :password => "jdoe")
    
    assert_equal "John Doe", @account.name
    assert_not_equal "john doe", @account.name
  end
end