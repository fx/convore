require 'test/unit'
require '../lib/convore'

class Test_Group < Test::Unit::TestCase
  
  def setup
    @username = 'Botticus'
    @password = 'bot123'
  end
  
  
  #def test_get_groups
  #  group = Convore::Group.new(@username, @password)
  #  response = group.get_groups
  #  assert_equal(response.code, 200)
  #end
  #
  #def test_create_group
  #  group = Convore::Group.new(@username, @password)
  #  hash = {:name => 'testgroup', :kind => 'private',
  #          :description => 'this is a test group', :slug => 'test' }
  #  response = group.create_group(hash)    
  #  assert_equal(response.code, 200)
  #end
  #
  ##1 parm
  #def test_get_group_info
  #  group = Convore::Group.new(@username, @password)
  #  response = group.get_group_info(7939)    
  #  assert_equal(response.code, 200)
  #end
  #
  ##2 parms
  #def test_get_group_members
  #  group = Convore::Group.new(@username, @password)
  #  response = group.get_group_members(7939, {:filter => 'admin'})    
  #  assert_equal(response.code, 200)
  #end
  
  def test_join_public_group
    group = Convore::Group.new(@username, @password)
    response = group.join_public_group(7939)    
    assert_equal(response.code, 200)
  end
  




  
end


