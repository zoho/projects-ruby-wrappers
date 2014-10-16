#  $Id$ 
module Projects
	module Api

		require File.dirname(__FILE__).chomp("/projects/api") + '/projects/api/API'
		require File.dirname(__FILE__).chomp("/projects/api") + '/projects/util/ZohoHTTPClient'
		require File.dirname(__FILE__).chomp("/projects/api") + '/projects/parser/TasklistParser'

		# * TasklistsAPI is used to:
		#  
		# * 	Get list of tasklists.
		#	  
		# * 	Create a new tasklist.
		#	  
		# * 	Update the details of a tasklist.
		#	  
		# * 	Delete an existing tasklist.


		class TasklistsAPI < API
			include Projects::Parser
			include Projects::Util
			# TasklistParser is used to parse the JSON response into respective objects.

			$tasklistParser = TasklistParser.new

			# * Construct a new TasklistsAPI using User's authToken and portalId.
			# 
			# ==== Parameters
			# 
			# * authToken:: - User's authToken.
			#  
			# * portalId:: - User's portalId.


			def initialize(authToken,portalId)
				super(authToken,portalId)
			end

			# * Get list of tasklists for the project.
			#  
			# ==== Parameters
			#
			# * projectId:: - ID of the project.
			#  
			# * queryMap:: - This queryMap contains the filters in the form of key-value pair.
			#  
			# ==== Returns
			#
			# * List of Tasklist object.

			def getTasklists(projectId,queryMap)
				url = getBaseURL+"projects/"+String(projectId)+"/tasklists/"
				response = ZohoHTTPClient.get(url, getQueryMap(queryMap))
				return $tasklistParser.getTasklists(response)
			end

			# * Create a new tasklist for the project.
			# 
			# ==== Parameters
			# 
			# * projectId:: - ID of the project.
			#  
			# * tasklist:: - tasklist object.
			#  
			# ==== Returns
			#
			# * Tasklist object.
			
			def create(projectId,tasklist)
				url = getBaseURL+"projects/"+String(projectId)+"/tasklists/"
				response = ZohoHTTPClient.post(url, getQueryMap, tasklist.toParamMAP)
				return $tasklistParser.getTasklist(response)
			end

			# * Update the details of a tasklist.
			#  
			# ==== Parameters
			#
			# * projectId:: - ID of the project.
			#  
			# * tasklist:: - Tasklist object.
			#  
			# ==== Returns
			#
			# * Tasklist object.
			
			def update(projectId,tasklist)
				url = getBaseURL+"projects/"+String(projectId)+"/tasklists/"+String(tasklist.getId)+"/"
				response = ZohoHTTPClient.post(url, getQueryMap, tasklist.toParamMAP)
				return $tasklistParser.getTasklist(response)
			end
			
			# * Delete an existing tasklist for the project.
			#  
			# ==== Parameters
			#
			# * projectId:: - ID of the project.
			#  
			# * tasklistId:: - ID of the tasklist.
			#  
			# ==== Returns
			#
			# * String object.

			def delete(projectId, tasklistId)
				url = getBaseURL+"projects/"+String(projectId)+"/tasklists/"+String(tasklistId)+"/"
				response = ZohoHTTPClient.delete(url, getQueryMap)
				return $tasklistParser.getResult(response)
			end
		end
	end
end