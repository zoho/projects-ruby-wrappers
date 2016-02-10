#  $Id$ 
module Projects
	module Api


		require File.dirname(__FILE__).chomp("/projects/api") + '/projects/api/API'
		require File.dirname(__FILE__).chomp("/projects/api") + '/projects/util/ZohoHTTPClient'
		require File.dirname(__FILE__).chomp("/projects/api") + '/projects/parser/ProjectParser'
		#require_relative 'API'

		# * ProjectsAPI is used to:
		#	 
		# * 	Get list of projects.
		#	 
		# * 	Get the details of a project.
		#	 
		# * 	Create a new project.
		#	 
		# * 	Update the details of a project.
		#	  
		# * 	Delete an existing project.

		class ProjectsAPI < API
			include Projects::Parser
			include Projects::Util

			# Parse the JSON response into respective objects.

			$projectParser = ProjectParser.new

			# * Construct a new ProjectsAPI using User's authToken and portalId.
			# 
			# ==== Parameters
			# 
			# * authToken:: - User's authToken.
			#  
			# * portalId:: - User's portalId.

			def initialize(authToken,portalId,apiKey=nil)
				super(authToken,portalId,apiKey)
			end

			# * Get the genearal url for getting all Projects.
			#
			# ==== Returns
			#
			# String Object

			def getProjectsUrl
				return getBaseURL+'projects/'
			end

			# * Get specific Project url by specifying the projectId.
			#
			# ==== Returns
			#
			# String Object

			def getProjectUrl(projectId)
				return getBaseURL+'projects/'+String(projectId)+'/'
			end

			# * Get list of projects.
			#  
			# ==== Parameters
			#
			# * queryMap:: - This queryMap contains the filters in the form of key-value pair.
			#  
			# ==== Returns
			#
			# * List of Project object.


			def getProjects(queryMap=nil)
				if queryMap == nil
					return $projectParser.getProjects(ZohoHTTPClient.get(getProjectsUrl,getQueryMap)) 
				else
					return $projectParser.getProjects(ZohoHTTPClient.get(getProjectsUrl,getQueryMap(queryMap)))
				end
			end

			# * Create a new project.
			# 
			# ==== Parameters
			#
			# * project:: - Project object.
			#  
			# ==== Returns
			#
			# * Project object.

			def createProject(project)
				createProject = ZohoHTTPClient.post(getProjectsUrl,getQueryMap, project.toParamMAP)
				return $projectParser.getProject(createProject)
			end

			# * Get the details of a project.
			#  
			# ==== Parameters
			#
			# * projectId:: - ID of the project.
			#  
			# ==== Returns
			#
			# * Project object.

			def get(projectId)
				response = ZohoHTTPClient.get(getProjectUrl(projectId),getQueryMap)
				return $projectParser.getProject(response)
			end

			# * Update the details of a project.
			#  
			# ==== Parameters
			#
			# * project:: - Project object.
			#  
			# ==== Returns
			#
			# * Project object.

			def updateProject(project)
				updateProject = ZohoHTTPClient.post(getProjectUrl(project.getId),getQueryMap, project.toParamMAP)
				return $projectParser.getProject(updateProject)
			end

			# * Delete an existing project.
			# 
			# ==== Parameters
			# 
			# * projectId:: - ID of the project.
			#  
			# ==== Returns
			#
			# * String object.
 
			def deleteProject(projectId)
				response = ZohoHTTPClient.delete(getProjectUrl(projectId),getQueryMap)
				return $projectParser.getResult(response)
			end

			# * Get list of project activities.
			#  
			# ==== Parameters
			#
			# * projectId:: - ID of the project.
			#  
			# * queryMap:: - This queryMap contains the filters in the form of key-value pair.
			#  
			# ==== Returns
			#
			# * List of Activity object.

			def getProjectActivities(projectId, queryMap=nil)
				url = getProjectUrl(projectId)+"activities/"
				if queryMap == nil
					return $projectParser.getActivities(ZohoHTTPClient.get(url, getQueryMap))
				else
					return $projectParser.getActivities(ZohoHTTPClient.get(url, getQueryMap(queryMap)))
				end
			end

			# * Get list of project statuses.
			#  
			# ==== Parameters
			#
			# * projectId:: - ID of the project.
			#  
			# * queryMap:: - This queryMap contains the filters in the form of key-value pair.
			#  
			# ==== Returns
			#
			# * List of Status object.

			def getProjectStatuses(projectId,queryMap=nil)
				url = getProjectUrl(projectId)+"statuses/"
				if queryMap == nil
					return $projectParser.getStatuses(ZohoHTTPClient.get(url, getQueryMap))
				else
					return $projectParser.getStatuses(ZohoHTTPClient.get(url, getQueryMap(queryMap)))
				end
			end

			# * Add the status for the project.
			#  
			# ==== Parameters
			#
			# * projectId:: - ID of the project.
			#  
			# * status:: - Status object.
			#  
			# ==== Returns
			#
			# * Status object.

			def addProjectStatus(projectId,status)
				url = getProjectUrl(projectId)+"statuses/"
				return $projectParser.getStatus(ZohoHTTPClient.post(url, getQueryMap, status.toParamMAP));
			end

		end
	end
end
