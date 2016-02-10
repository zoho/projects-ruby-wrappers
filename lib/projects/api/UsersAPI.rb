#  $Id$ 
module Projects
	module Api

		require File.dirname(__FILE__).chomp("/projects/api") + '/projects/api/API'
		require File.dirname(__FILE__).chomp("/projects/api") + '/projects/util/ZohoHTTPClient'
		require File.dirname(__FILE__).chomp("/projects/api") + '/projects/parser/UserParser'


		# * UsersAPI is used to get list of users for the project.

		class UsersAPI < API
			include Projects::Parser
			include Projects::Util
			# UserParser is used to parse the JSON response into respective objects.

			$userParser =UserParser.new

			# * Construct a new UsersAPI using User's authToken and portalId.
			# 
			# ==== Parameters
			# 
			# * authToken:: - User's authToken.
			#  
			# * portalId:: - User's portalId.

			def initialize(authToken,portalId,apiKey=nil)
				super(authToken,portalId,apiKey)
			end

			# * Get list of users for the project.
			# 
			# ==== Parameters
			#   
			# * projectId:: - ID of the project.
			#  
			# ==== Returns
			# 
			# * List of User object.

			def getUsers(projectId)
				url = getBaseURL+"projects/"+String(projectId)+"/users/"		
				response = ZohoHTTPClient.get(url, getQueryMap)		
				return $userParser.getUsers(response)
			end
		end
	end
end
