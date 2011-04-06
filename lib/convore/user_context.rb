module Convore
	class UserContext
        @username ||= nil
		@password ||= nil
		
		class << self
            attr_accessor :waffles
		end
		
	end
end