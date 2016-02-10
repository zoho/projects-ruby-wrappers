#  $Id$ 
module Projects
	module Api
				
		require File.dirname(__FILE__).chomp("/projects/api") + '/projects/api/API'
		require File.dirname(__FILE__).chomp("/projects/api") + '/projects/util/ZohoHTTPClient'
		require File.dirname(__FILE__).chomp("/projects/api") + '/projects/parser/BugParser'

		# * BugsAPI is used to:
		#
		# * Get list of bugs.
		# 
		# * Get the details of a bug.
		# 
		# * Creates a bug.
		# 
		# * Update the details of a bug.
		# 
		# * Delete an existing bug.

		class BugsAPI < API 
			include Projects::Parser
			include Projects::Util
			# * BugParser is used to parse the JSON response into respective objects.

			$bugParser = BugParser.new

			# * Construct a BugsAPI using User's authToken and portalId.
			# 
			# ==== Parameters
			# 
			# * authToken:: - User's authToken.
			# 
			# * portalId:: - User's portalId.


			def initialize(authToken,portalId,apiKey=nil)
				super(authToken,portalId,apiKey)
			end

			# * Get list of bugs for the project.
			# 
			# ==== Parameters
			# 
			# * projectId:: - ID of the project.
			# 
			# * queryMap:: - This queryMap contains the filters in the form of key-value pair.
			# 
			# ==== Returns
			#
			# * List of Bug object.

			
			def getBugs(projectId, queryMap)
				url = getBaseURL+"projects/"+String(projectId)+"/bugs/"		
				response = ZohoHTTPClient.get(url, getQueryMap(queryMap))	
				return $bugParser.getBugs(response)
			end

			# * Get the details of a bug.
			# 
			# ==== Parameters
			#
			# * projectId:: - ID of the project.
			# 
			# * bugId:: - ID of the bug.
			# 
			# ==== Return
			#
			# * Bug object.

			
			def get(projectId, bugId)
				url = getBaseURL+"projects/"+String(projectId)+"/bugs/"+String(bugId)+"/"		
				response = ZohoHTTPClient.get(url, getQueryMap)		
				return $bugParser.getBug(response)
			end

			# * Create a Bug for the project.
			# 
			# ==== Parameters
			#
			# * projectId:: - ID of the project.
			# 
			# * bug:: - Bug object.
			# 
			# ==== Returns
			#
			# * Bug object.

			
			def create(projectId, bug)
				url = getBaseURL+"projects/"+String(projectId)+"/bugs/"		
				response = ZohoHTTPClient.post(url, getQueryMap, bug.toParamMAP)		
				return $bugParser.getBug(response)
			end

			# * Update the details of a bug.
			# 
			# ==== Parameters
			#
			# * projectId:: - ID of the project.
			# 
			# * bug:: - Bug object.
			#
			# ==== Returns
			#
			# * Bug object.
			
			def update(projectId, bug)
				url = getBaseURL+"projects/"+String(projectId)+"/bugs/"+String(bug.getId)+"/"		
				response = ZohoHTTPClient.post(url, getQueryMap, bug.toParamMAP)		
				return $bugParser.getBug(response)
			end

			# * Delete an existing bug for the project.
			# 
			# ==== Parameters
			#
			# * projectId:: - ID of the project.
			#
			# * bugId:: - ID of the bug.
			# 
			# ==== Returns
			#
			# * String containg result of delete.

			def delete(projectId, bugId)
				url = getBaseURL+"projects/"+String(projectId)+"/bugs/"+String(bugId)+"/"		
				response = ZohoHTTPClient.delete(url, getQueryMap)		
				return $bugParser.getResult(response)
			end
			
			
			# * Get all the default fields in the given project.
			#
			# ==== Parameters
			#
			# * projectId:: - ID of the project.
			#
			# ==== Returns
			#
			# * Returns the Defaultfield object.
			
			
			def getDefaultfields(projectId)
			
				url = getBaseURL+"projects/"+String(projectId)+"/bugs/defaultfields/"
				
				response = ZohoHTTPClient.get(url, getQueryMap)
				
				return @bugParser.getDefaultfields(response)
				
			end
			
			
			
			# * Get all the custom fields in the given project.
			#
			# ==== Parameters
			#
			# * projectId:: - ID of the project.
			#
			# ==== Returns
			# 
			# * Returns list of Customfield object.
			
			def getCustomfields(projectId)
			
				url = getBaseURL+"projects/"+String(projectId)+"/bugs/customfields/"
				
				response = ZohoHTTPClient.get(url, getQueryMap)
				
				return @bugParser.getCustomfields(response)
				
			end
			
		end
	end
end
