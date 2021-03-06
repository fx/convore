#TODO: More robust checkingthen 200, works for now though

require 'test/unit'
require '../lib/convore'

class Test_Account < Test::Unit::TestCase
  
  def setup
    @username = 'Botticus'
    @password = 'bot123'
  end
  
  def test_verified?
    account = Convore::Account.new(@username, @password)
    response = account.verified?
    assert_equal(response.code, 200)
  end
  
  def test_mark_all_read
    account = Convore::Account.new(@username, @password)
    response = account.mark_all_read
    assert_equal(response.code, 200)
  end
  
  def test_get_members_online
    account = Convore::Account.new(@username, @password)
    response = account.get_members_online
    assert_equal(response.code, 200)
  end
  
  def test_get_mentions
    account = Convore::Account.new(@username, @password)
    response = account.get_mentions
    assert_equal(response.code, 200)
  end
  
end


