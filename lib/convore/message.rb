module Convore
	class Message < Base
		
		def initialize(username, password)
			@username = username
			@password = password
		end
		
		#Star a message. If the message has already been starred by this user,
		# this endpoint will then unstar the message.
		def star_message(message_id)
			if message_id.integer?
				RestClient.post "https://#{username}:#{password}@convore.com/api/messages/#{message_id}/star.json"
			end
		end
		
		#Delete a message. You must be the creator of the message or a group admin in order to delete the message.
		def get_message(message_id)
			if message_id.integer?
				RestClient.post "https://#{username}:#{password}@convore.com/api/messages/#{message_id}/delete.json"
			end
		end
		
		#Delete a message. You must be the creator of the message or a group admin in order to delete the message.
		def get_message(message_id)
			if message_id.integer?
				RestClient.post "https://#{username}:#{password}@convore.com/api/messages/#{message_id}/star.json"
			end
		end
		
		
		def text
			message
		end
	end
end