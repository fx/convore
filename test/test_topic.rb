require 'test/unit'
require '../lib/convore'

class Test_Topic < Test::Unit::TestCase
  
  def setup
    @username = 'Botticus'
    @password = 'bot123'
  end
  
  
  def test_get_topic
    topic = Convore::Topic.new(@username, @password)
    response = topic.get_topic(8595)
    assert_equal(response.code, 200)
  end
  
  def test_get_topic_messages
    topic = Convore::Topic.new(@username, @password)
    response = topic.get_topic_messages(8595, { :until_id => 11, :mark_read => 'false'})
    assert_equal(response.code, 200)
  end
  
  def test_create_message
    topic = Convore::Topic.new(@username, @password)
    response = topic.get_topic_messages(8595, {:message => 'waffles123123'})
    assert_equal(response.code, 200)
  end
  
  def test_delete_topic
    topic = Convore::Topic.new(@username, @password)
    response = topic.delete_topic(8595)
    assert_equal(response.code, 200)
  end
  
  def test_edit_topic
    topic = Convore::Topic.new(@username, @password)
    response = topic.edit_topic(8595, {:topic_text => "Y so srs?"} )
    assert_equal(response.code, 200)
  end
  
  def test_mark_read
    topic = Convore::Topic.new(@username, @password)
    response = topic.mark_read(8595 )
    assert_equal(response.code, 200)
  end

end