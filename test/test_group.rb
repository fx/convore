require 'test/unit'
require '../lib/convore'

class Test_Group < Test::Unit::TestCase
  
  def setup
    @username = 'Botticus'
    @password = 'bot123'
  end
  
  
  def test_get_groups
    group = Convore::Group.new(@username, @password)
    response = group.get_groups
    assert_equal(response.code, 200)
  end
  
  def test_create_group
    group = Convore::Group.new(@username, @password)
    hash = {:name => 'testgroup', :kind => 'private',
            :description => 'this is a test group', :slug => 'test' }
    response = group.create_group(hash)    
    assert_equal(response.code, 200)
  end
  
  def test_get_group_info
    group = Convore::Group.new(@username, @password)
    response = group.get_group_info(7939)    
    assert_equal(response.code, 200)
  end
  
  #1 parms
  def test_get_group_members_1
    group = Convore::Group.new(@username, @password)
    response = group.get_group_members(7939)    
    assert_equal(response.code, 200)
  end
  
  #2 parms
  def test_get_group_members_2
    group = Convore::Group.new(@username, @password)
    response = group.get_group_members(7939, {:filter => 'admin'})    
    assert_equal(response.code, 200)
  end
  
  def test_join_public_group
    group = Convore::Group.new(@username, @password)
    response = group.join_public_group(7939)    
    assert_equal(response.code, 200)
  end
  
  def test_join_private_group
    group = Convore::Group.new(@username, @password)
    response = group.join_public_group(8595)    
    assert_equal(response.code, 200)
  end
  
  def test_leave_group
    group = Convore::Group.new(@username, @password)
    response = group.leave_group(7939)    
    assert_equal(response.code, 200)
  end

  def test_get_online_members
    group = Convore::Group.new(@username, @password)
    response = group.leave_group(7939)    
    assert_equal(response.code, 200)
  end
  
  #1 parm
  def test_get_latest_topics_1
    group = Convore::Group.new(@username, @password)
    response = group.get_latest_topics(7939)    
    assert_equal(response.code, 200)
  end
  
  #2 parm
  def test_get_latest_topics_2
    group = Convore::Group.new(@username, @password)
    response = group.get_latest_topics(7939, {:until_id => 1})    
    assert_equal(response.code, 200)
  end
  
  def test_create_topic
    group = Convore::Group.new(@username, @password)
    response = group.create_topic(8482, {:name => "I am a test topic"})    
    assert_equal(response.code, 200)
  end
  
  def test_mark_all_read
    group = Convore::Group.new(@username, @password)
    response = group.mark_all_read(8482)    
    assert_equal(response.code, 200)
  end
  
end


