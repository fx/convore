# TODO: Establish link to client connect, to use their username/password?

module Convore
	class API
		class << self
			def cache
				@@cache ||= {}
			end

			def get(api_uri, username=nil, password=nil)
				response = cache[api_uri] ? cache[api_uri] : 
				Net::HTTP.start('convore.com', 443, nil, nil, nil, nil, {:use_ssl => true}) {|http|
					req = Net::HTTP::Get.new(api_uri)
					req.basic_auth(username, password) if username && password
					req.set_content_type('application/json')
					http.request(req)
				}
				cache[api_uri] = response
			end
		end
	end
end