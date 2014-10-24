#  $Id$ 
module Projects
	module Api

		require File.dirname(__FILE__).chomp("/projects/api") + '/projects/api/API'
		require File.dirname(__FILE__).chomp("/projects/api") + '/projects/util/ZohoHTTPClient'
		require File.dirname(__FILE__).chomp("/projects/api") + '/projects/parser/TaskParser'

		# * TasksAPI is used to:
		#	  
		# * 	Get list of tasks.
		#	 
		# * 	Get list of task for the tasklist.
		#	  
		# * 	Get the details of a task.
		#	  
		# * 	Create a new task.
		#	  
		# * 	Update the details of a task.
		#	  
		# * 	Delete an existing task.

		class TasksAPI < API
			include Projects::Parser
			include Projects::Util
			# TaskParser is used to parse the JSON response into respective objects.

			$taskParser = Projects::Parser::TaskParser.new

			# * Construct a new TasksAPI using User's authToken and portalId.
			# 
			# ==== Parameters
			# 
			# * authToken:: User's authToken.
			#  
			# * portalId:: - User's portalId.

			def initialize(authToken,portalId)
				super(authToken,portalId)
			end

			# * Get list of tasks for the project.
			# 
			# ==== Parameters
			# 
			# * projectId:: - ID of the project.
			#  
			# * queryMap:: - This queryMap contains the filters in the form of key-value pair.
			#  
			# ==== Returns
			#
			# * List of Task object.

			def getTasks(projectId, queryMap)
				url = getBaseURL+"projects/"+String(projectId)+"/tasks/"
				response = ZohoHTTPClient.get(url, getQueryMap(queryMap))
				return $taskParser.getTasks(response)
			end
			
			# * Get list of tasks for the task list.
			# 
			# ==== Parameters
			# 
			# * projectId:: - ID of the project.
			#  
			# * tasklistId:: - ID of the tasklist.
			#  
			# * queryMap:: - This queryMap contains the filters in the form of key-value pair.
			#  
			# ==== Returns
			#
			# * List Task object.

			def getTasklistTasks(projectId, tasklistId, queryMap)
				url = getBaseURL+"projects/"+String(projectId)+"/tasklists/"+String(tasklistId)+"/tasks/"
				response = ZohoHTTPClient.get(url, getQueryMap(queryMap))		
				return $taskParser.getTasks(response)
			end

			# * Get the details of a task.
			# 
			# ==== Parameters
			# 
			# * projectId:: - ID of the project.
			# 
			# * taskId:: - ID of the task.
			#  
			# ==== Returns
			#
			# * Task object.
			
			def get(projectId, taskId)
				url = getBaseURL+"projects/"+String(projectId)+"/tasks/"+String(taskId)+"/"
				response = ZohoHTTPClient.get(url, getQueryMap)		
				return $taskParser.getTask(response)
			end

			# * Create a new task for the project.
			# 
			# ==== Parameters
			# 
			# * projectId:: - ID of the project.
			#  
			# * task:: - Task object.
			#  
			# ==== Returns
			#
			# * Task object.
			
			def create(projectId, task)
				url = getBaseURL+"projects/"+String(projectId)+"/tasks/"		
				response = ZohoHTTPClient.post(url, getQueryMap, task.toParamMAP)		
				return $taskParser.getTask(response)
			end
			
			# * Update the details of a task.
			# 
			# ==== Parameters
			# 
			# * projectId:: - ID of the project.
			#  
			# * task:: - Task object.
			#  
			# ==== Returns
			#
			# * Task object.

			def update(projectId, task)
				url = getBaseURL+"projects/"+String(projectId)+"/tasks/"+String(task.getId())+"/"		
				response = ZohoHTTPClient.post(url, getQueryMap, task.toParamMAP)		
				return $taskParser.getTask(response)
			end
			
			# * Delete an existing task.
			# 
			# ==== Parameters
			#  
			# * projectId:: - ID of the project.
			#  
			# * taskId:: - ID of the task.
			#  
			# ==== Returns
			#
			# * String object.

			def delete(projectId, taskId)
				url = getBaseURL+"projects/"+String(projectId)+"/tasks/"+String(taskId)+"/"		
				response = ZohoHTTPClient.delete(url, getQueryMap)
				return $taskParser.getResult(response)
			end
			
			
			# * Get all the subtasks of the given task.
			#
			# ==== Parameters
			#  
			# * projectId:: - ID of the project.
			#  
			# * taskId:: - ID of the task.
			#  
			# ==== Returns
			#
			# * List of Task object.
			
			
			def getSubtasks(projectId, taskId, queryMap)
			
				url = getBaseURL+"projects/"+String(projectId)+"/tasks/"+String(taskId)+"/subtasks/"
				
				response = ZohoHTTPClient.get(url, getQueryMap(queryMap))
				
				return @taskParser.getTasks(response)
			end
			
			
			# * Get all the task comment.
			#
			# ==== Parameters
			#
			# * projectId:: - ID of the project.
			#  
			# * taskId:: - ID of the task.
			#  
			# ==== Returns
			#
			# * List of Comment object.
			
			def getComments(projectId, taskId, queryMap)
			
				url = getBaseURL+"projects/"+String(projectId)+"/tasks/"+String(taskId)+"/comments/"
				
				response = ZohoHTTPClient.get(url, getQueryMap(queryMap))
				
				return @taskParser.getComments(response)
				
			end
			
			# * Add the task comment.
			#
			# ==== Parameters
			#
			# * projectId:: - ID of the project.
			#  
			# * taskId:: - ID of the task.
			#
			# * content:: - Comment of the task
			#
			# ==== Returns
			#
			# * Returns the Comment object.
			
			def addComment(projectId, taskId, content)
			
				url = getBaseURL+"projects/"+String(projectId)+"/tasks/"+String(taskId)+"/comments/"
				
				paramMap = Hash.new
				paramMap["content"] = content
				
				response = ZohoHTTPClient.post(url, getQueryMap, paramMap)
				
				return @taskParser.getComment(response)
				
			end
			
			
			# * Delete an existing task comment.
			#
			# ==== Parameters
			#
			# * projectId:: - ID of the project.
			#  
			# * taskId:: - ID of the task.
			#
			# * commentId:: - ID of the task Comment.
			#
			# ==== Returns
			#
			# * Returns the success message(Comment Deleted Successfully).
			
			def deleteComment(projectId, taskId, commentId)
			
				url = getBaseURL+"projects/"+String(projectId)+"/tasks/"+String(taskId)+"/comments/"+String(commentId)+"/"
				
				response = ZohoHTTPClient.delete(url, getQueryMap)
				
				return @taskParser.getResult(response)
				
			end
			
						
		end
	end
end
