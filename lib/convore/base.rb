module Convore
	class Base
		attr_accessor :attributes

		def initialize
			@attributes ||= {}
		end

		def method_missing(method, *args)
			if method.match(/\=/)
				@attributes[method.to_s.gsub(/\=$/, '').to_sym] = args.first
				return true
			else
				return @attributes[method] if @attributes[method]
			end
			raise NoMethodError.new("no such method: #{method}")
		end

		class << self

			def get_class(key)
				case key
				when 'message' then	Message
				when 'user', 'creator', 'mentioned_user' then User
				when 'group' then Group
				when 'topic' then Topic
				end
			end

			def from_json(json)
				return nil if !json

				object = new
				json.each {|key, val|
					key_class = get_class(key)

					value = if val.is_a?(Hash) && key_class
						key_class.from_json(json[key])
					elsif val.is_a?(Numeric) && key_class && key_class.api
						key_class.find(val)
					else
						val
					end

					object.send("#{key}=", value)
				}
				object
			end
			
			def api
				nil
			end
			
			def find(rid)
				return false if !api || !rid.is_a?(Numeric)

				api_uri = "/api/#{api[-1] == 's' ? api : "#{api}s"}/#{rid}.json"

				response = Convore::API.get(api_uri)
				
				json = JSON.parse(response.body)
				from_json(json[api])
			end
		end
	end
end