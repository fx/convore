#TODO  accept jsonup in rest client
#If posts don't have a mandatory payload they need to be fed a hash {}
require 'rest-client'

module Convore
	class Group < Base
		attr_accessor :username, :password

		def initialize(username, password)
			@username = username
			@password = password
		end
		
		#Get a list of the current user's groups
		def get_groups
			RestClient.get "https://#{username}:#{password}@convore.com/api/groups.json"
		end
		
		#Create a new group.
		def create_group(hash)
			RestClient.post "https://#{username}:#{password}@convore.com/api/groups/create.json",
				{:name => hash[:name],
				 :kind => hash[:kind],
				 #from here down optional
				 :description => hash[:description],
				 :slug => hash[:slug]}
		end
		
		#Get detailed information about the group
		def get_group_info(group_id)
			if group_id.integer?
				RestClient.get "https://#{@username}:#{@password}@convore.com/api/groups/#{group_id}.json"
			end
		end
		
		#Get the group members
		def get_group_members(group_id, *hash)
			if group_id.integer?
				RestClient.get "https://#{username}:#{password}@convore.com/api/groups/#{group_id}/members.json",
				#from here down optional
				#{:filter => hash[:admin]}
				hash[0]
			end
		end
		
		#Join a public group
		def join_public_group(group_id)
			if group_id.integer?
				RestClient.post "https://#{username}:#{password}@convore.com/api/groups/#{group_id}/join.json", {}
			end
		end
		
		#Requests to join a private group
		def join_private_group(group_id)
			if group_id.integer?
				RestClient.post "https://#{username}:#{password}@convore.com/api/groups/#{group_id}/request.json", ()
			end
		end
		
		#Leave a group
		def leave_group(group_id)
			if group_id.integer?
				RestClient.post "https://#{username}:#{password}@convore.com/api/groups/#{group_id}/leave.json", {}
			end
		end
		
		#Get group members online now
		def get_online_members(group_id)
			if group_id.integer?
				RestClient.post "https://#{username}:#{password}@convore.com/api/groups/#{group_id}/online.json", {}
			end
		end
		
		#Get the latest topics in a group
		def get_latest_topics(group_id, *hash)
			if group_id.integer?
				RestClient.get "https://#{username}:#{password}@convore.com/api/groups/#{group_id}/topics.json",
				#from here down optional (pagination)
				#{:until_id => hash[:until_id]}
				hash[0]
			end
		end
		
		#Create a new topic
		def create_topic(group_id, hash)
			if group_id.integer?
				RestClient.post "https://#{username}:#{password}@convore.com/api/groups/#{group_id}/topics/create.json",
				{:name => hash[:name]}
			end
		end
		
		#Mark all messages in the group as read
		def mark_all_read(group_id)
			if group_id.integer?
				RestClient.post "https://#{username}:#{password}@convore.com/api/groups/#{group_id}/mark_read.json", {}
			end
		end	
		
		def self.api
			'group'
		end
	end
end