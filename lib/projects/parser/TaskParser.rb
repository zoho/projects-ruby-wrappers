#  $Id$ 
module Projects
	module Parser

		require 'json'
		require File.dirname(__FILE__).chomp("/projects/parser") + '/projects/model/Task'
		require File.dirname(__FILE__).chomp("/projects/parser") + '/projects/model/Comment'
		require File.dirname(__FILE__).chomp("/projects/parser") + '/projects/model/Owner'
		require File.dirname(__FILE__).chomp("/projects/parser") + '/projects/model/Tasklist'

		# * Parse the JSON response into respective objects.

		class TaskParser
			include Projects::Model
			# * Parse the JSON response and make it into List of Task object.
			#
			# ==== Parameters
			# 
			# * response:: - This JSON response contains the details of tasks.
			#
			# ==== Returns
			#  
			# * List of Task object.

			def getTasks(response)
				tasks_all_json = JSON.parse response
				tasks_all_array = tasks_all_json["tasks"]
				tasks_class_array = Array.new
				for i in 0...tasks_all_array.length
					tasks_class_array.push(jsonToTask(tasks_all_array[i]))
				end
				return tasks_class_array
			end

			# * Parse the JSON response and make it into Task object.
			#
			# ==== Parameters
			# 
			# * response:: - This JSON response contains the details of a task.
			#
			# ==== Returns
			#  
			# * Task object.

			def getTask(response)
				tasks_json = JSON.parse response
				tasks_array = tasks_json["tasks"]
				return jsonToTask(tasks_array[0])
			end

			# * Parse the JSONObject into Task object.
			#
			# ==== Parameters
			#  
			# * jsonObject:: - JSONObject contains the details of a task.
			#
			# ==== Returns
			# 
			# * Task object.
				
			def jsonToTask(jsonObject)
				task = Task.new
				
				if jsonObject.has_key?("id")
					task.setId(jsonObject["id"])
				end
				if jsonObject.has_key?("name")
					task.setName(jsonObject["name"])
				end
				if jsonObject.has_key?("completed")
					task.setCompleted(jsonObject["completed"])
				end
				if jsonObject.has_key?("created_by")
					task.setCreatedBy(jsonObject["created_by"])
				end
				if jsonObject.has_key?("created_person")
					task.setCreatedPerson(jsonObject["created_person"])
				end
				if jsonObject.has_key?("priority")
					task.setPriority(jsonObject["priority"])
				end
				if jsonObject.has_key?("percent_complete")
					task.setPercentComplete(jsonObject["percent_complete"])
				end
				if jsonObject.has_key?("start_date")
					task.setStartDate(jsonObject["start_date"])
				end
				if jsonObject.has_key?("start_date_format")
					task.setStartDateFormat(jsonObject["start_date_format"])
				end
				if jsonObject.has_key?("start_date_long")
					task.setStartDateLong(jsonObject["start_date_long"])
				end
				if jsonObject.has_key?("end_date")
					task.setEndDate(jsonObject["end_date"])
				end
				if jsonObject.has_key?("end_date_format")
					task.setEndDateFormat(jsonObject["end_date_format"])
				end
				if jsonObject.has_key?("end_date_long")
					task.setEndDateLong(jsonObject["end_date_long"])
				end
				if jsonObject.has_key?("duration")
					task.setDuration(jsonObject["duration"])
				end
				
				if jsonObject.has_key?("details")
					details = jsonObject["details"]
					
					if details.has_key?("owners")
						owners = details["owners"]
						ownerList = Array.new
						
						for i in 0...owners.length
							owner = owners[i]
							ownerList.push(jsonToOwner(owner))
						end

						task.setOwners(ownerList)
					end
					
					if details.has_key?("comments")
						comments = details["comments"]
						
						commentList = Array.new

						for j in 0...comments.length
							comment = comments[j]
							commentList.push(jsonToComment(comment))
						end

						task.setComments(commentList)
					end
					
					if details.has_key?("documents")
						documents = details["documents"]
						documentIds = Array.new

						for l in 0...documents.length
							documentIds[l] = String(documents[l]["id"])
						end
						
						task.setAssociateDocumentIds(documentIds)
					end
					
					if details.has_key?("forums")
						forums = details["forums"]
						forumIds = Array.new

						for m in 0...forums.length
							forumIds[m] = String(forums[m]["id"])
						end
						
						task.setAssociateForumIds(forumIds)
					end
				end
				
				if jsonObject.has_key?("link")
					link = jsonObject["link"]
						
					if link.has_key?("self")
						task.setURL(link["self"]["url"])
					end
					if link.has_key?("timesheet")
						task.setTimesheetURL(link["timesheet"]["url"])
					end
				end
				
				if jsonObject.has_key?("subtasks")
					subtasks = jsonObject["subtasks"]
					
					tasks = Array.new

					for k in 0...subtasks.length
						taskObj = subtasks[k]
						tasks.push(jsonToTask(taskObj))
					end
					
					task.setSubtasks(tasks)
				end
				
				if jsonObject.has_key?("tasklist")
					tasklist = jsonObject["tasklist"]
					
					task.setTasklist(jsonToTasklist(tasklist))
				end
				
				return task
			end

			# * Parse the JSONObject into Owner object.
			#
			# ==== Parameters
			#  
			# * jsonObject:: - JSONObject contains the details of a owner.
			#
			# ==== Returns
			#   
			# * Owner object.

			def jsonToOwner(jsonObject)
				owner = Owner.new
				
				if jsonObject.has_key?("id")
					owner.setId(jsonObject["id"])
				end
				if jsonObject.has_key?("name")
					owner.setName(jsonObject["name"])
				end
				return owner
			end
			
			# * Parse the JSONObject into Comment object.
			#
			# ==== Parameters
			#  
			# * jsonObject:: - JSONObject contains the details of a comment.
			#
			# ==== Returns
			#   
			# * Comment object.

			def jsonToComment(jsonObject)
				comment = Comment.new
				
				if jsonObject.has_key?("id")
					comment.setId(jsonObject["id"])
				end
				if jsonObject.has_key?("content")
					comment.setContent(jsonObject["content"])
				end
				if jsonObject.has_key?("created_time")
					comment.setCreatedTime(jsonObject["created_time"])
				end
				if jsonObject.has_key?("created_time_format")
					comment.setCreatedTimeFormat(jsonObject["created_time_format"])
				end
				if jsonObject.has_key?("created_time_long")
					comment.setCreatedTimeLong(jsonObject["created_time_long"])
				end
				if jsonObject.has_key?("added_by")
					comment.setAddedBy(jsonObject["added_by"])
				end
				if jsonObject.has_key?("added_person")
					comment.setAddedPerson(jsonObject["added_person"])
				end
				if jsonObject.has_key?("updated_by")
					comment.setUpdatedBy(jsonObject["updated_by"])
				end
				return comment
			end

			# * Parse the JSONObject into Tasklist object.
			#
			# ==== Parameters
			# 
			# * jsonObject:: - JSONObject contains the details of a task list.
			#
			# ==== Returns
			#  
			# * Tasklist object.
			
			def jsonToTasklist(jsonObject)
				tasklist = Tasklist.new
				
				if jsonObject.has_key?("id")
					tasklist.setId(jsonObject["id"])
				end
				if jsonObject.has_key?("name")
					tasklist.setName(jsonObject["name"])
				end
				
				return tasklist
			end

			# * Parse the JSON response and get the success message.
			#
			# ==== Parameters
			#   
			# * response:: - This JSON response contains the success message.
			#
			# ==== Returns
			# 	  
			# * String object.

			def getResult(response)
				jsonObject = JSON.parse response
				result = jsonObject["response"]
				return result
			end
		end
	end
end