#  $Id$ 
module Projects
	module Api

		require File.dirname(__FILE__).chomp("/projects/api") + '/projects/api/API'
		require File.dirname(__FILE__).chomp("/projects/api") + '/projects/util/ZohoHTTPClient'
		require File.dirname(__FILE__).chomp("/projects/api") + '/projects/parser/TimesheetParser'


		# * TimesheetAPI is used to:
		#  
		# * 	Get list of time logs.
		#	  
		# * 	Add new task log.
		#	  
		# * 	update the details of a task log.
		#	  
		# * 	Delete an existing task log.
		#	  
		# * 	Add new bug log.
		#	  
		# * 	Update the details of a bug log.
		#	  
		# * 	Delete an existing bug log.
		#	  
		# * 	Add new general log.
		#	  
		# * 	Update the details of a general log.
		#	  
		# * 	Delete an existing general log.

		class TimesheetsAPI < API
			include Projects::Parser
			include Projects::Util
			# TimesheetParser is used to parse the JSON response into respective objects.

			$timesheetParser = TimesheetParser.new	

			# * Construct a new TimesheetsAPI using User's authToken and portalId.
			# 
			# ==== Parameters
			#   
			# * authToken:: - User's authToken.
			#  
			# * portalId:: - User's portalId.

			def initialize(authToken,portalId,apiKey=nil)
				super(authToken,portalId,apiKey)
			end
			
			# * Get list of time logs for the project.
			# 
			# ==== Parameters
			#  
			# * projectId:: - ID 0f the project.
			#  
			# * queryMap:: - This queryMap contains the filters in the form of key-value pair.
			#  
			# ==== Returns
			#
			# * TimelogList object.

			def getTimeLogs(projectId, queryMap)		
				url = getBaseURL+"projects/"+String(projectId)+"/logs/"		
				response = ZohoHTTPClient.get(url, getQueryMap(queryMap))
				return $timesheetParser.getTimeLogs(response)
			end

			# * Add a new task log for the project.
			# 
			# ==== Parameters
			# 
			# * projectId:: - ID of the project.
			#  
			# * tasklog:: - Tasklog object.
			#  
			# ==== Returns
			#
			# * Tasklog object.
			
			def addTasklog(projectId, tasklog)
				url = getBaseURL+"projects/"+String(projectId)+"/tasks/"+String(tasklog.getTaskId)+"/logs/"		
				response = ZohoHTTPClient.post(url, getQueryMap, tasklog.toParamMAP)		
				return $timesheetParser.getTasklog(response)
			end
			
			# * Update the details of a task log.
			# 
			# ==== Parameters
			# 
			# * projectId ID of the project.
			#  
			# * tasklog:: - Tasklog object.
			#  
			# ==== Returns
			#
			# * Tasklog object.

			def updateTasklog(projectId, tasklog)
				url = getBaseURL+"projects/"+String(projectId)+"/tasks/"+String(tasklog.getTaskId)+"/logs/"+String(tasklog.getId)+"/"		
				response = ZohoHTTPClient.post(url, getQueryMap, tasklog.toParamMAP)		
				return $timesheetParser.getTasklog(response)
			end

			# * Delete an existing task log for the project.
			# 
			# ==== Parameters
			#  
			# * projectId:: - ID of the project.
			#  
			# * taskId:: - ID of the task.
			#  
			# * logId:: - ID of the log.
			#  
			# ==== Returns
			#
			# * String object.
			
			def deleteTasklog(projectId, taskId, logId)
				url = getBaseURL+"projects/"+String(projectId)+"/tasks/"+String(taskId)+"/logs/"+String(logId)+"/"		
				response = ZohoHTTPClient.delete(url, getQueryMap)		
				return $timesheetParser.getResult(response)
			end

			# * Add a new bug log for the project.
			# 
			# ==== Parameters
			#  
			# * projectId:: - ID of the project.
			#  
			# * buglog:: - Buglog object.
			#  
			# ==== Returns
			#
		 	# * Buglog object.
			
			def addBuglog(projectId, buglog)
				url = getBaseURL+"projects/"+String(projectId)+"/bugs/"+String(buglog.getBugId)+"/logs/"		
				response = ZohoHTTPClient.post(url, getQueryMap, buglog.toParamMAP)		
				return $timesheetParser.getBuglog(response)
			end

			# * Update the details of a bug log.
			# 
			# ==== Parameters
			# 
			# * projectId:: - ID of the project.
			#  
			# * buglog:: - Buglog object.
			#  
			# ==== Returns
			#
			# * Buglog object.
			
			def updateBuglog(projectId, buglog)
				url = getBaseURL+"projects/"+String(projectId)+"/bugs/"+String(buglog.getBugId)+"/logs/"+String(buglog.getId)+"/"		
				response = ZohoHTTPClient.post(url, getQueryMap, buglog.toParamMAP)		
				return $timesheetParser.getBuglog(response)
			end

			# * Delete an existing bug log for the project.
			# 
			# ==== Parameters
			# 
			# * projectId:: - ID of the project.
			#  
			# * bugId:: - ID of the bug.
			#  
			# * logId:: - ID of the log.
			#  
			# ==== Returns
			#
			# * String object.
			
			def deleteBuglog(projectId, bugId, logId)
				url = getBaseURL+"projects/"+String(projectId)+"/bugs/"+String(bugId)+"/logs/"+String(logId)+"/"				
				response = ZohoHTTPClient.delete(url, getQueryMap)		
				return $timesheetParser.getResult(response)
			end

			# * Add a new general log for the project.
			# 
			# ==== Parameters
			#  
			# * projectId:: - ID of the project.
			#  
			# * generallog:: - Generallog object.
			#  
			# ==== Returns
			# 
			# * Generallog object.
			
			def addGenerallog(projectId, generallog)
				url = getBaseURL+"projects/"+String(projectId)+"/logs/"	
				requestBody = generallog.toParamMAP		
				requestBody["name"] = generallog.getName		
				response = ZohoHTTPClient.post(url, getQueryMap, requestBody)		
				return $timesheetParser.getGenerallog(response)
			end

			# * Update the details of a general log.
			# 
			# ==== Parameters
			#  
			# * projectId:: - ID of the project.
			#  
			# * generallog:: - Generallog object.
			#  
			# ==== Returns
			#
			# * Generallog object.
			
			def updateGenerallog(projectId, generallog)
				url = getBaseURL+"projects/"+String(projectId)+"/logs/"+String(generallog.getId)+"/"		
				requestBody = generallog.toParamMAP		
				requestBody["name"] = generallog.getName
				response = ZohoHTTPClient.post(url, getQueryMap, requestBody)		
				return $timesheetParser.getGenerallog(response)
			end
			
			# * Delete an existing general log for the project.
			# 
			# ==== Parameters
			# 
			# * projectId:: - ID of the project.
			#  
			# * logId:: - ID of the log.
			#  
			# ==== Returns
			#
			# * String object.

			def deleteGenerallog(projectId, logId)
				url = getBaseURL+"projects/"+String(projectId)+"/logs/"+String(logId)+"/"		
				response = ZohoHTTPClient.delete(url, getQueryMap)		
				return $timesheetParser.getResult(response)
			end
		end
	end
end
