#  $Id$ 
module Projects
	module Api

		require File.dirname(__FILE__).chomp("/projects/api") + '/projects/api/API'
		require File.dirname(__FILE__).chomp("/projects/api") + '/projects/util/ZohoHTTPClient'
		require File.dirname(__FILE__).chomp("/projects/api") + '/projects/parser/MilestonesParser'


		# * MilestonesAPI is used to:
		# 
		# * 	Get list of milestones.
		#	 
		# * 	Get the details of a milestone.
		#	 
		# * 	Create a new milestone.
		#	 
		# * 	Update the details of a milestone.
		#	 
		# * 	Update the status of a milestone.
		#	 
		# * 	Delete an existing milestone.


		class MilestonesAPI < API
			include Projects::Parser
			include Projects::Util
			# MilestoneParser is used to parse the JSON response into respective objects.

			$milestonesParser = MilestonesParser.new

			# * Construct a new MilestonesAPI using User's authToken and portalId.
			# 
			# ==== Parameters
			#
			# * authToken:: - User's authToken.
		 	#
			# * portalId:: - User's portalId.

			def initialize(authToken,portalId)
				super(authToken,portalId)
			end

			# * Get list of milestones for the project.
		 	#
		 	# ==== Parameters
		 	#
			# * projectId:: - ID of the project.
		 	#
			# * queryMap:: - This queryMap contains the filters in the form of key-value pair.
		 	#
		 	# ==== Returns
		 	#
			# * List of Milestone object.

			def getMilestones(projectId, * queryMap)
				url = getBaseURL+"projects/"+String(projectId)+"/milestones/"
				if queryMap.length == 0
					response = ZohoHTTPClient.get(url, getQueryMap)
				else
					response = ZohoHTTPClient.get(url, getQueryMap(queryMap))
				end
				return $milestonesParser.getMilestones(response)
			end

			# * Get the details of a milestone.
			# 
			# ==== Parameters
			# 
			# * projectId:: - ID of the project.
			#  
			# * milestoneId:: - ID of the milestone.
			# 
			#  ==== Returns
			#
			# * Milestone object.

			def get(projectId,milestoneId)
				url = getBaseURL+"projects/"+String(projectId)+"/milestones/"+String(milestoneId)+"/"
				response = ZohoHTTPClient.get(url, getQueryMap)
				return $milestonesParser.getMilestone(response)
			end

			# * Create a milestone for the project.
			# 
			# ==== Parameters
			#
			# * projectId:: - ID of the project.
			#  
			# * milestone:: - Milestone object.
			# 
			# ==== Returns
			# * Milestone object.

			def create(projectId,milestone)
				url = getBaseURL+"projects/"+String(projectId)+"/milestones/"
				response = ZohoHTTPClient.post(url, getQueryMap, milestone.toParamMAP())
				return $milestonesParser.getMilestone(response)
			end

			# * Update the details of a milestone.
			#  
			# ==== Parameters
			#
			# * projectId:: - ID of the project.
			#  
			# * milestone:: - Milestone object.
			#  
			# ==== Returns
			# * Milestone object.

			def update(projectId,milestone)
				url = getBaseURL+"projects/"+String(projectId)+"/milestones/"+String(milestone.getId)+"/"
				response = ZohoHTTPClient.post(url, getQueryMap, milestone.toParamMAP())
				return $milestonesParser.getMilestone(response)
			end

			# * Update the status of a milestone.
			# 
			# ==== Parameters
			#
			# * projectId:: - ID of the project.
			#  
			# * milestoneId:: - ID of the milestone.
			#  
			# * status:: - Status of the milestone.
			#  
			# ==== Returns
			#
			# * Milestone object.
			
			def updateStatus(projectId,milestoneId,status)
				url = getBaseURL+"projects/"+String(projectId)+"/milestones/"+String(milestoneId)+"/status/"
				requestBody = Hash.new()
				requestBody["status"] = status
				response = ZohoHTTPClient.post(url, getQueryMap, requestBody)
				return $milestonesParser.getMilestone(response)
			end

			# * Delete an existing milestone for the project.
			#  
			# ==== Parameters
			#
			# * projectId:: - ID of the project.
			#  
			# * milestoneId:: - ID of the milestone.
			#  
			# ==== Returns
			#
			# * String object.
			
			def delete(projectId,milestoneId)
				url = getBaseURL+"projects/"+String(projectId)+"/milestones/"+String(milestoneId)+"/"
				response = ZohoHTTPClient.delete(url, getQueryMap)
				return $milestonesParser.getResult(response)
			end
		end
	end
end