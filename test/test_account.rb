require 'test/unit'
require '../lib/convore'

class Test_Account < Test::Unit::TestCase
  
  def setup
    @username = 'Botticus'
    @password = 'bot123'
  end
  
  #check if you can login
  def test_verified?
    account = Convore::Account.new(@username, @password)
    response = account.verified?
    assert_equal(response.code, 200)
  end
  
  #mark all of the outstanding messages as read
  #error code 405?
  #def test_mark_all_read
  #  account = Convore::Account.new(@username, @password)
  #  response = account.mark_all_read
  #  assert_equal(response.code, 200)
  #end
  
  #get all members
  def test_get_members_online
    account = Convore::Account.new(@username, @password)
    response = account.get_members_online
    assert_equal(response.code, 200)
  end
  

end


