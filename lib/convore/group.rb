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
			RestClient.get "https://#{username}:#{password}@convore.com/api/groups.json", {:accept => :json}
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
		def get_group_info(id)
			if id.integer?
				RestClient.post "https://#{username}:#{password}@convore.com/api/groups/#{id}.json"
			end
		end
		
		#Get the group members
		def get_group_info(id)
			if id.integer?
				RestClient.post "https://#{username}:#{password}@convore.com/api/groups/#{id}/members.json"
			end
		end
		
		
		
	
#

#Note: Specify admin for the optional filter parameter to get only group admins.
#https://convore.com/api/groups/:group_id/members.json
#Request method: GET
#Required parameters: group_id
#Optional parameters: filter
#groups/:group_id/join.json
#
#Joins a public group.
#https://convore.com/api/groups/:group_id/join.json
#Request method: POST
#Auth: HTTP basic authentication
#Required parameters: group_id
#groups/:group_id/request.json
#
#Requests to join a private group.
#https://convore.com/api/groups/:group_id/request.json
#Request method: POST
#Auth: HTTP basic authentication
#Required parameters: group_id
#groups/:group_id/leave.json
#
#Leave a group.
#https://convore.com/api/groups/:group_id/leave.json
#Request method: POST
#Auth: HTTP basic authentication
#Required parameters: group_id
#groups/:group_id/online.json
#
#Get group members online now.
#https://convore.com/api/groups/:group_id/online.json
#Request method: GET
#Auth: HTTP basic authentication
#Required parameters: group_id
#groups/:group_id/topics.json
#
#Get the latest topics in a group. Use the optional until_id parameter to paginate and get prior topics.
#https://convore.com/api/groups/:group_id/topics.json
#Request method: GET
#Auth: HTTP basic authentication
#Required parameters: group_id
#Optional parameters: until_id
#groups/:group_id/topics/create.json
#
#Create a new topic.
#https://convore.com/api/groups/:group_id/topics/create.json
#Request method: POST
#Auth: HTTP basic authentication
#Required parameters: group_id, name
#groups/:group_id/mark_read.json
#
#Mark all messages in the group as read.
#https://convore.com/api/groups/:group_id/mark_read.json
#Request method: POST
#Auth: HTTP basic authentication
#Required parameters: group_id
#		
		
		
		def self.api
			'group'
		end
	end
end