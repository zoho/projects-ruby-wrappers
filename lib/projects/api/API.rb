#  $Id$ 
module Projects
	module Api
		# * API is used to maintain the base URL and makes a query map using User's authToken and filters.

		class API

			public
			@@baseURL = "https://projectsapi.zoho.com/restapi/";
			protected
			  	attr_accessor :authToken, :portalId, :apiKey
			  	
			public

				# * Construct a new API using User's authToken and portalId.
				#
				# ==== Parameters
				# 
				# * authToken:: - User's authToken. 
				#
				# * portalId:: - User's portalId.

			  	def initialize(authToken, portalId, apiKey=nil)
			    	raise ArgumentError, 'authToken is required' if authToken.to_s.empty?
			    	@authToken = authToken
			    	@portalId = portalId
			    	@apiKey = apiKey
			  	end
			
			public

				# * Get the base URL of the service.
				#
				# ==== Returns
				#
				# * Base URL.

			 	def getBaseURL
		  			raise ArgumentError, 'portalId is required' if portalId.to_s.empty?
		  			return @@baseURL+"portal/"+String(portalId)+"/";
		  		end

				# * Creates a query map using User's authToken and filters.
				# ==== Returns
				# 
				# * HashMap.	

		  		def getQueryMap(queryMap=nil)
		  			if queryMap != nil
			  			queryMap1 = queryMap
			  			queryMap1["authtoken"] = authToken
			  		else
			  			queryMap1 = Hash.new
		  				queryMap1["authtoken"] = authToken
			  		end
		  			if apiKey != nil
		  				queryMap1["apikey"] = apiKey
			  		end
		  		return queryMap1
		  		end
		end
	end
end
