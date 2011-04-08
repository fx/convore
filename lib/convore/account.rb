require 'rest-client'

module Convore
	class Account < Base
		attr_accessor :username, :password

		def initialize(username, password)
			@username = username
			@password = password
		end
		
		#Use this method to check if the user is properly logged in (also get user id)
		def verified?
			RestClient.get "https://#{username}:#{password}@convore.com/api/account/verify.json", {:accept => :json}
		end
		
		#Mark all messages as read
		#getting back a 405, does this even work?
		def mark_all_read
			RestClient.post "https://#{username}:#{password}@convore.com/api/account/mark_read.json", {:accept => :json}
		end
		
		#Get members online now
		def get_members_online
			RestClient.get "https://#{username}:#{password}@convore.com/api/account/online.json", {:accept => :json}
		end
		
		#Get the users mentions
		def get_mentions
			RestClient.get "https://#{username}:#{password}@convore.com/api/account/online.json", {:accept => :json}
		end

	end
end