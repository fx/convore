module Convore
	class Star < Base
		class << self
			def from_json(json)
				object = new
				object.user = User.from_json(json['user'])
				object.message = Message.from_json(json['star']['message'])
				object.star = json['kind'] == 'star' ? true : false
				object
			end
		end
		
		def star?
			star
		end
	end
end