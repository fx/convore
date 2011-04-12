require 'test/unit'
require '../lib/convore'

class Test_User < Test::Unit::TestCase
  
  def setup
    @username = 'Botticus'
    @password = 'bot123'
  end
  
  
  def test_get_info
    message = Convore::User.new(@username, @password)
    response = message.get_info(8595)
    assert_equal(response.code, 200)
  end

end