require 'rest-client'

module Convore
	class Account < Base
		attr_accessor :username, :password

		def initialize(username, password)
			@username = username
			@password = password
		end
		
		#Use this method to check if the user is properly logged in.
		#Check to see if you can even log in..
		def verified?
			RestClient.get "https://#{username}:#{password}@convore.com/api/account/verify.json", {:accept => :json}
		end
		
		
		
		
	end
end