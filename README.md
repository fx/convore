Convore API
===========

Quick implementation of the Convore.com API in ruby.

Usage
-----

	require 'convore'

	@client = Convore::Client.new
	@client.username = 'user'
	@client.password = 'pass'

	# listen will fork a thread that listens to the long polling /api/live.json
	# the poll function will check if the thread exited (i.e. a response was received)
	# process the response and relaunch the thread

	@client.listen

	while true do
		@client.poll # optionally takes a float for how long to wait for the poll thread to exit, defaults to 0.05

		while m = @client.stream.pop do
			case m
			when Convore::Topic then
				puts "#{m.group.name}: Topic '#{m.name}' created by #{m.user.username}"
			when Convore::Message then
				puts "#{m.group.name}: [##{m.topic.name}] <#{m.user.username}> #{m.text}"
			when Convore::Star then
				puts "* #{m.user.username} has #{m.star? ? 'stared' : 'unstared'} '#{m.message.text}' by #{m.message.user.username}"
			else
				puts "UNKNOWN MESSAGE: #{m.inspect}"
			end
		end

		sleep(1)
	end

All models are quick hacks - Group and Topic have #find, which fetches a given ID via the Rest API.

I wrote this to implement it in an rbot plugin ..watch out for that, coming soon (or maybe not)