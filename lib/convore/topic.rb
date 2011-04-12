module Convore
	class Topic < Base
		
		def initialize(username, password)
			@username = username
			@password = password
		end
		
		#Get detailed information about the topic
		def get_topic(topic_id)
			if topic_id.integer?
				RestClient.get "https://#{username}:#{password}@convore.com/api/topics/#{topic_id}.json"
			end
		end
		
		#Get the latest messages in a topic. Use the optional until_id parameter
		#to paginate and get prior messages. Set the optional mark_read parameter
		#to false to leave the messages as unread
		def get_topic_messages(topic_id, *hash)
			if topic_id.integer?
				RestClient.get "https://#{username}:#{password}@convore.com/api/topics/#{topic_id}/messages.json",
				#Optional Parms
				#until_id
				#mark_read
				hash[0]
			end
		end
		
		#Post a new message
		def create_message(topic_id, hash)
			if topic_id.integer?
				RestClient.post "https://#{username}:#{password}@convore.com/api/topics/#{topic_id}/messages/create.json",
				{:message => hash[:message]}
			end
		end
		
		#Delete a topic. You must be the creator of the topic or a
		# group admin in order to delete the topic.
		def delete_topic(topic_id)
			if topic_id.integer?
				RestClient.post "https://#{username}:#{password}@convore.com/api/topics/#{topic_id}/delete.json", {}
			end
		end
		
		#Edit a topic. You must be the creator of the topic or a group admin in order to edit the topic.
		def edit_topic(topic_id, hash)
			if topic_id.integer?
				RestClient.post "https://#{username}:#{password}@convore.com/api/topics/#{topic_id}/edit.json",
				{:name => hash[:name]}
			end
		end
		
		#Mark all messages in a topic as read
		def mark_read(topic_id)
			if topic_id.integer?
				RestClient.post "https://#{username}:#{password}@convore.com/api/topics/#{topic_id}/mark_read.json", {}
			end
		end
		
		def self.api
			'topic'
		end
	end
end