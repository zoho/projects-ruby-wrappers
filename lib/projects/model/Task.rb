#  $Id$ 
module Projects
	module Model
		# * This class is used to make an object for Task.

		class Task

			private
				attr_accessor :id, :name, :completed, :createdBy, :createdPerson, :priority, :percentComplete, :startDate, :startDateFormat, :startDateLong, :endDate, :endDateFormat, :endDateLong, :duration, :url, :timesheetUrl, :owners, :comments, :associateDocumentIds, :associateForumIds, :asks, :tasklist
			
			public

				# * Set the task id.
				# 
				# ==== Parameters
				# 
				# * id:: - ID of the task.

				def setId(id)
					@id = id
				end

				# * Get the task id.
				#
				# ==== Returns
				#  
				# * Task id.
				
				def getId
					return @id
				end

				# * Set the task name.
				# 
				# ==== Parameters
				# 
				# * name:: - Name of the task.
				
				def setName(name)
					@name = name
				end

				# * Get the task name.
				#
				# ==== Returns
				#  
				# * Task name.
				
				def getName
					return @name
				end

				# * Set whether the task is completed or not.
				# 
				# ==== Parameters
				#  
				# * completed:: - Is task is completed or not.
				
				def setCompleted(completed)
					@completed = completed
				end

				# * Get whether the task is completed or not.
				#
				# ==== Returns
				#  
				# * true, if the task is completed else false.
				
				def isCompleted
					return @completed
				end

				# * Set the id of the person who created the task.
				# 
				# ==== Parameters
				#  
				# * createdBy:: - Id of the user who created the task.
				
				def setCreatedBy(createdBy)
					@createdBy = createdBy
				end

				# * Get the id of the user who created the task.
				#
				# ==== Returns
				# 
				# * Id of the person who created the task.
				
				def getCreatedBy
					return @createdBy
				end

				# * Set the task created person name.
				# 
				# ==== Parameters
				#  
				# * createdPerson:: - Name of the person who created the task.
				
				def setCreatedPerson(createdPerson)
					@createdPerson = createdPerson
				end

				# * Get the name of the person who created the task.
				#
				# ==== Returns
				#  
				# * Task created person name.
				
				def getCreatedPerson
					return @createdPerson
				end

				# * Set the priority of the task.
				# 
				# ==== Parameters
				#  
				# * priority:: - Priority of the task.
				
				def setPriority(priority)
					@priority = priority
				end

				# * Get the priority of the task.
				#
				# ==== Returns
				# 
				# * Task priority.
				
				def getPriority
					return @priority
				end

				# * Set the task completed percent.
				# 
				# ==== Parameters
				#  
				# * percentComplete:: - Task completed percent.
				
				def setPercentComplete(percentComplete)
					@percentComplete = percentComplete
				end

				# * Get the task completed percent.
				#
				# ==== Returns
				#  
				# * Task complete percent.
				
				def getPercentComplete
					return @percentComplete
				end

				# * Set the task start date.
				# 
				# ==== Parameters
				#  
				# * startDate:: - Start date of the task.
				
				def setStartDate(startDate)
					@startDate = startDate
				end

				# * Get the task start date.
				#
				# ==== Returns
				#   
				# * Task start date.
				
				def getStartDate
					return startDate
				end

				# * Set the task start date format. 
				# 
				# ==== Parameters
				#  
				# * startDate:: - Start date format of the task.
				
				def setStartDateFormat(startDateFormat)
					@startDateFormat = startDateFormat
				end

				# * Get the task start date format.
				#
				# ==== Returns
				#   
				# * Task start date format.
				
				def getStartDateFormat
					return @startDateFormat
				end

				# * Set the start date long.
				# 
				# ==== Parameters
				#  
				# * startDateLong:: - Start date long for the task.
				
				def setStartDateLong(startDateLong)
					@startDateLong = startDateLong
				end

				# * Get the start date long.
				#
				# ==== Returns
				#  
				# * Task start date long.
				
				def getStartDateLong
					return @startDateLong
				end

				# * Set the task end date.
				# 
				# ==== Parameters
				#  
				# * endDate:: - End date of the task.
				
				def setEndDate(endDate)
					@endDate = endDate
				end

				# * Get the task end date.
				#
				# ==== Returns
				#  
				# * task end date.
				
				def getEndDate
					return @endDate
				end

				# * Set the task end date format.
				# 
				# ==== Parameters
				#  
				# * endDate:: - End date format of the task.
				
				def setEndDateFormat(endDateFormat)
					@endDateFormat = endDateFormat
				end

				# * Get the task end date format.
				#
				# ==== Returns
				#   
				# * Task end date format.
				
				def getEndDateFormat
					return @endDateFormat
				end

				# * Set the end date long.
				# 
				# ==== Parameters
				#  
				# * endDateLong:: - End date for the task.
				
				def setEndDateLong(endDateLong)
					@endDateLong = endDateLong
				end

				# * Get the end date long.
				#
				# ==== Returns
				#   
				# * Task end date long.
				
				def getEndDateLong
					return @endDateLong
				end

				# * Set the task duration.
				# 
				# ==== Parameters
				#  
				# * duration:: - Duration of the task.
				
				def setDuration(duration)
					@duration = duration
				end

				# * Get the task duration.
				#
				# ==== Returns
				#  
				# * Task duration.
				
				def getDuration
					return @duration
				end

				# * Set the task URL.
				# 
				# ==== Parameters
				# 
				# * url:: - URL for the task.
				
				def setURL(url)
					@url = url
				end

				# * Get the task URL.
				#
				# ==== Returns
				#   
				# * Task URL.
				
				def getURL
					return @url
				end

				# * Set the time sheet URL.
				# 
				# ==== Parameters
				#  
				# * timesheetUrl:: - URL for the time sheet.
				
				def setTimesheetURL(timesheetUrl)
					@timesheetUrl = timesheetUrl
				end

				# * Get the time sheet URL.
				#
				# ==== Returns
				#   
				# * Time sheet URL.
				
				def getTimesheetURL
					return @timesheetUrl
				end

				# * Set the owners of the task.
				# 
				# ==== Parameters
				# 
				# * owners:: - List of Owner object.
				
				def setOwners(owners)
					@owners = owners
				end

				# * Get the owner of the task.
				#
				# ==== Returns
				#   
				# * List of Owner object.
				
				def getOwners
					return @owners
				end

				# * Set the comments of the task.
				# 
				# ==== Parameters
				#  
				# * comments:: - List of Comment object.
				
				def setComments(comments)
					@comments = comments
				end

				# * Get the comments of the task.
				#
				# ==== Returns
				#  
				# * List of Comment object.
				
				def getComments
					return @comments
				end

				# * Set the associated document IDs of the task.
				# 
				# ==== Parameters
				# 
				# * associateDocumentIds:: - Document IDs of the task.
				
				def setAssociateDocumentIds(associateDocumentIds)
					@associateDocumentIds = associateDocumentIds
				end

				# * Get the associated document IDs of the task.
				#
				# ==== Returns
				#   
				# * Array of document IDs.
				
				def getAssociateDocumentIds
					return @associateDocumentIds
				end

				# * Set the associated forum IDs.
				# 
				# ==== Parameters
				#  
				# * associateForumIds:: - Forum IDs of the task.
				
				def setAssociateForumIds(associateForumIds)
					@associateForumIds = associateForumIds
				end

				# * Get the associated forum IDs of the task.
				#
				# ==== Returns
				#  
				# * Array of forum IDs.
				
				def getAssociateForumIds
					return @associateForumIds
				end

				# * Set the subtasks of the task.
				# 
				# ==== Parameters
				#  
				# * tasks:: - List of Task object.
				
				def setSubtasks(tasks)
					@tasks = tasks
				end

				# * Get the subtasks of the task.
				#
				# ==== Returns
				#   
				# * List of Task object.
				
				def getSubtasks
					return @tasks
				end

				# * Set the tasklist of the task.
				# 
				# ==== Parameters
				#  
				# * tasklist:: - Tasklist object.
				
				def setTasklist(tasklist)
					@tasklist = tasklist
				end

				# * Get the tasklist of the task.
				#
				# ==== Returns
				#  
				# * Tasklist object.
				
				def getTasklist
					return @tasklist
				end

				# * Convert the Task object into HashMap.
				#
				# ==== Returns
				# 
				# * HashMap object.
				
				def toParamMAP()
					requestBody = Hash.new
					
					if owners != nil
						
						personResponsible = "";
						
						owners.each do|owner|
							personResponsible += String(owner.getId)+","
						end

						requestBody["person_responsible"] = personResponsible
					
					end

					if name != nil
						requestBody["name"] = name
					end
					if tasklist != nil
						requestBody["tasklist_id"] = tasklist.getId
					end
					if startDate != nil
						requestBody["start_date"] = startDate
					end
					if endDate != nil
						requestBody["end_date"] = endDate
					end
					if duration != nil
						requestBody["duration"] = duration
					end
					if priority != nil
						requestBody["priority"] = priority
					end
					
					return requestBody
				end
		end
	end
end