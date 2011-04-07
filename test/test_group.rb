require 'test/unit'
require '../lib/convore'

class Test_Group < Test::Unit::TestCase
  
  def setup
    @username = 'Botticus'
    @password = 'bot123'
  end
  
  
  def test_get_auth_groups
    group = Convore::Group.new(@username, @password)
    response = group.get_groups
    assert_equal(response.code, 200)
  end
  

  
end


