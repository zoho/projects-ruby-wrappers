#  $Id$ 
module Projects
	module Api

		require File.dirname(__FILE__).chomp("/projects/api") + '/projects/api/API'
		require  File.dirname(__FILE__).chomp("/projects/api") +'/projects/util/ZohoHTTPClient'
		require File.dirname(__FILE__).chomp("/projects/api") +'/projects/parser/PortalParser'
		require File.dirname(__FILE__).chomp("/projects/api") +'/projects/exception/ProjectsException'


		# * PortalsAPI is used to get list of portals.

		class PortalAPI < API
			include Projects::Parser
			include Projects::Util
			# * Construct a new PortalsAPI using User's authTken.
			# 
			# ==== Parameters
			#
			# * authToken:: - User's authToken.

			def initialize(authToken, apiKey=nil)
				super(authToken,"",apiKey)
			end

			# * Parse the JSON response into respective objects.
			#
			# * Get list of portals.
			# 
			# ==== Returns
			#
			# * List of Portal object.

			def getPortals
				portalParser = PortalParser.new
				url = @@baseURL+'portals/'
				return portalParser.getPortals(ZohoHTTPClient.get(url,getQueryMap))
			end
		end
	end
end
