require 'test/unit'
require '../lib/convore'

class Test_Group < Test::Unit::TestCase
  attr_accessor :username, :password
  
  def initialize(username, password)
    @username = username
    @password = password
  end

  def test_get_auth_groups
    group = Convore::Group.new(@username, @password)
    group.get_groups
  end
  
  #check if logged in
  #check if group exists
  #
  
end


