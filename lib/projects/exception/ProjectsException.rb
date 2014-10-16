#  $Id$ 
module Projects
	module Pexception

		 # * ProjectsException is used to throw a new projects exception with code and message.

		class ProjectsException < Exception
			
			private
				attr_accessor :code, :message

			public

				# * Construct a new ProjectsException by passing an error code and error message.
				#
				# ==== Parameters
				# 
				# * code:: - Error code.
				#
				# * message:: - Error message.

				def initialize(code, message)
					super(message)
					@code = code		
					@message = message
				end

				# * get the error code.
				#
				# ==== Returns
				#	
				# * Error code.

				def getCode
					return @code
				end
				
				# * get the error message.
				#
				# ==== Returns
				#
				# * Error message.

				def getMessage
					return @message
				end
			
		end
	end
end