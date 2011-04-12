require 'test/unit'
require '../lib/convore'

class Test_Message < Test::Unit::TestCase
  
  def setup
    @username = 'Botticus'
    @password = 'bot123'
  end
  
  
  def test_star_message
    message = Convore::Message.new(@username, @password)
    response = message.star_message(8595)
    assert_equal(response.code, 200)
  end
  
  def test_delete_message
    message = Convore::Message.new(@username, @password)
    response = message.delete_message(8595)
    assert_equal(response.code, 200)
  end

end