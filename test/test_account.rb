require 'test/unit'
require '../lib/convore'

class Test_Account < Test::Unit::TestCase
  
  def setup
    @username = 'Botticus'
    @password = 'bot123'
  end
  
  def test_verified
    a = Convore::Account.new(@username, @password)
    response = a.verified?
    assert_equal(response.code, 200)
  end

end


