require 'rest-client'

module Convore
	class Group < Base
		attr_accessor :username, :password

		def initialize(username, password)
			@username = username
			@password = password
		end
		
		#get all of the groups that the user belongs to
		def get_auth_groups
			RestClient.get "https://#{username}:#{password}@convore.com/api/groups.json", {:accept => :json}
		end
		
		def waffles
			'waffles'
		end
		
		def self.api
			'group'
		end
	end
end