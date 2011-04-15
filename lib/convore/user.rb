module Convore
	class User < Base
		
		def initialize(username, password)
			@username = username
			@password = password
		end
		
		#Get detailed information about the user
		def get_info(user_id)
			if user_id.integer?
				RestClient.get "https://#{@username}:#{@password}@convore.com/api/users/#{user_id}.json"
			end
		end
	end
end