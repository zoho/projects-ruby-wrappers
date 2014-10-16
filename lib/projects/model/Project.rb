#  $Id$ 
module Projects
	module Model
		# * This class is used to make an object for Project.

		class Project
			private
			attr_accessor :id, :name, :status, :createdDate, :createdDateFormat, :createdDateLong, :description, :ownerName, :ownerId, :openTaskCount, :closedTaskCount, :openMilestoneCount, :closedMilestoneCount, :openBugCount, :closedBugCount, :URL, :activityURL, :milestoneURL, :tasklistURL, :taskURL, :bugURL, :timesheetURL, :statusURL, :eventURL, :documentURL, :folderURL, :forumURL, :userURL 

			public

				# * Set the project id.
				# 
				# ==== Parameters
				#  
				# * id:: - ID of the project.

				def getId
					return @id
				end

				# * Get the project id.
				#
				# ==== Returns
				# 
				# * Project id.

				def setId(id)
					@id = id
				end

				# * Set the project name.
				# 
				# ==== Parameters
				#  
				# * name:: - Name of the project.

				def setName(name)
					@name = name
				end

				# * Get the project name.
				#
				# ==== Returns
				#  
				# * Project name.
				
				def getName
					return @name
				end

				# * Set the status of the project.
				# 
				# ==== Parameters
				#  
				# * status:: - Status of the project.
				
				def setStatus(status)
					@status = status
				end

				# * Get the project status.
				#
				# ==== Returns
				# 
				# * Project status.

				def getStatus
					return @status
				end

				# * Set the date when the project is being created.
				# 
				# ==== Parameters
				#  
				# * createdDate:: - Created date for the project.

				def setCreatedDate(createdDate)
					@createdDate = createdDate
				end

				# * Get the project created date.
				#
				# ==== Returns
				# 
				# * Project created date.
				
				def getCreatedDate
					return @createdDate
				end

				# * Set the created date format for the project.
				# 
				# ==== Parameters
				#  
				# * createdDate:: - Project created date format.

				def setCreatedDateFormat(createdDateFormat)
					@createdDateFormat = createdDateFormat
				end

				# * Get the created date format for the project.
				#
				# ==== Returns
				# 
				# * Project created date format.
				
				def getCreatedDateFormat
					return @createdDateFormat
				end

				# * Set the project created date.
				# 
				# ==== Parameters
				# 
				# * createdDateLong:: - Project created date.

				def setCreatedDateLong(createdDateLong)
					@createdDateLong = createdDateLong
				end

				# * Get the project created date long.
				#
				# ==== Returns
				# 
				# * project created date long.
				
				def getCreatedDateLong
					return @createdDateLong
				end

				# * Set the project description.
				# 
				# ==== Parameters
				# 
				# * description:: - Description of the project.

				def setDescription(description)
					@description = description
				end

				# * Get the project description.
				#
				# ==== Returns
				# 
				# * Project description.

				def getDescription
					return @description
				end

				# * Set the owner name.
				# 
				# ==== Parameters
				# 
				# * ownerName:: - Name of the owner.
			
				def setOwnerName(ownerName)
					@ownerName = ownerName
				end

				# * Get the owner name.
				#
				# ==== Returns
				# 
				# * The owner name.

				def getOwnerName
					return @ownerName
				end

				# * Set the owner id.
				# 
				# ==== Parameters
				#  
				# * ownerId:: - ID of the owner.
				
				def setOwnerId(ownerId)
					@ownerId = ownerId
				end

				# * Get the owner id.
				#
				# ==== Returns
				#  
				# * Owner id.
			
				def getOwnerId
					return @ownerId
				end

				# * Set the open task count.
				# 
				# ==== Parameters
				#  
				# * openTaskCount:: - Open task count for the project.
			
				def setOpenTaskCount(openTaskCount)
					@openTaskCount = openTaskCount
				end

				# * Get the open task count.
				#
				# ==== Returns
				#  
				# * Open task count for the project.

				def getOpenTaskCount
					return @openTaskCount
				end

				# * Set the closed task count.
				# 
				# ==== Parameters
				# 
				# * closedTaskCount:: - Closed task count for the project.

				def setClosedTaskCount(closedTaskCount)
					@closedTaskCount = closedTaskCount
				end

				# * Get the closed task count.
				#
				# ==== Returns
				#  
				# * Closed task count for the project.
			
				def getClosedTaskCount
					return @closedTaskCount
				end

				# * Set the open milestone count.
				# 
				# ==== Parameters
				#  
				# * openMilestoneCount:: - Open milestone count for the project.

				def setOpenMilestoneCount(openMilestoneCount)
					@openMilestoneCount = openMilestoneCount
				end

				# * Get the open milestone count.
				#
				# ==== Returns
				#  
				# * Open milestone count for the project.
			
				def getOpenMilestoneCount
					return @openMilestoneCount
				end

				# * Set the closed milestone count.
				# 
				# ==== Parameters
				#  
				# * closedMilestoneCount:: - Closed milestone count for the project.

				def setClosedMilestoneCount(closedMilestoneCount)
					@closedMilestoneCount = closedMilestoneCount
				end

				# * Get the closed milestone count.
				#
				# ==== Returns
				#
				# * closed milestone count for the project.

				def getClosedMilestoneCount
					return @closedMilestoneCount
				end

				# * Set the open bug count.
				# 
				# ==== Parameters
				# 
				# * openBugCount:: - Open bug count for the project.
			
				def setOpenBugCount(openBugCount)
					@openBugCount = openBugCount
				end

				# * Get the open bug count.
				#
				# ==== Returns
				# 
				# * Open bug count for the project.
			
				def getOpenBugCount
					return @openBugCount
				end

				# * Set the closed bug count.
				# 
				# ==== Parameters
				#  
				# * closedBugCount:: - Closed bug count for the project.
			
				def setClosedBugCount(closedBugCount)
					@closedBugCount = closedBugCount
				end

				# * Get the closed bug count.
				#
				# ==== Returns
				# 
				# * Closed bug count for the project.
			
				def getClosedBugCount
					return @closedBugCount
				end

				# * Set the project URL.
				# 
				# ==== Parameters
				#  
				# * url:: - URL for the project.
			
				def setURL(url)
					@url = url
				end

				# * Get the project URL.
				#
				# ==== Returns
				#  
				# * Project URL.

				def getURL
					return @url
				end

				# * Set the activity URL.
				# 
				# ==== Parameters
				#  
				# * activityUrl:: - URL for the activity.

				def setActivityURL(activityUrl)
					@activityUrl = activityUrl
				end

				# * Get the activity URL.
				#
				# ==== Returns
				#  
				# * Activity URL.
			
				def getActivityURL
					return @activityUrl
				end

				# * Set the milestone URL.
				# 
				# ==== Parameters
				#  
				# * milestoneUrl:: - URL for the milestone.
			
				def setMilestoneURL(milestoneUrl)
					@milestoneUrl = milestoneUrl
				end

				# * Get the milestone URL.
				#
				# ==== Returns
				#  
				# * milestone URL.

				def getMilestoneURL
					return @milestoneUrl
				end

				# * Set the task list URL.
				# 
				# ==== Parameters
				# 
				# * tasklistUrl:: - URL for the task list.
			
				def setTasklistURL(tasklistUrl)
					@tasklistUrl = tasklistUrl
				end

				# * Get the task list URL.
				#
				# ==== Returns
				#  
				# * Task list URL.
			
				def getTasklistURL
					return @tasklistUrl
				end

				# * Set the task URL.
				# 
				# ==== Parameters
				#  
				# * taskUrl:: - URL for the task.

				def setTaskURL(taskUrl)
					@taskUrl = taskUrl
				end

				# * Get the task URL.
				#
				# ==== Returns
				#  
				# * task URL.
			
				def getTaskURL
					return @taskUrl
				end

				# * Set the bug URL.
				# 
				# ==== Parameters
				# 
				# * bugUrl:: - URL for the bug.
			
				def setBugURL(bugUrl)
					@bugUrl = bugUrl
				end

				# * Get the bug URL.
				#
				# ==== Returns
				#  
				# * bug URL.
			
				def getBugURL
					return @bugUrl
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

				# * Set the status URL.
				# 
				# ==== Parameters
				#  
				# * statusUrl:: - URL for the status.

				def setStatusURL(statusUrl)
					@statusUrl = statusUrl
				end

				# * Get the status URL.
				#
				# ==== Returns
				#  
				# * Status URL.

				def getStatusURL
					return @statusUrl
				end

				# * Set the event URL.
				# 
				# ==== Parameters
				#  
				# * eventUrl:: - URL for the event.

				def setEventURL(eventUrl)
					@eventUrl = eventUrl
				end

				# * Get the event URL.
				#
				# ==== Returns
				# 
				# * Event URL.

				def getEventURL
					return @eventUrl
				end

				# * Set the document URL.
				# 
				# ==== Parameters
				# 
				# * documentUrl:: - URL for the document.

				def setDocumentURL(documentUrl)
					@documentUrl = documentUrl
				end

				# * Get the document URL.
				#
				# ==== Returns
				#  
				# * Document URL.

				def getDocumentURL
					return @documentUrl
				end

				# * Set the folder URL.
				# 
				# ==== Parameters
				#  
				# * folderUrl:: - URL for the folder.
			
				def setFolderURL(folderUrl)
					@folderUrl = folderUrl
				end

				# * Get the folder URL.
				#
				# ==== Returns
				#  
				# * Folder URL.
			
				def getFolderURL
					return @folderUrl
				end

				# * Set the forum URL.
				# 
				# ==== Parameters
				#  
				# * forumUrl:: - URL for the forum.
			
				def setForumURL(forumUrl)
					@forumUrl = forumUrl
				end

				# * Get the forum URL.
				#
				# ==== Returns
				#  
				# * Forum URL.

				def getForumURL 
					return @forumUrl
				end

				# * Set the user URL.
				# 
				# ==== Parameters
				# 
				# * userUrl:: - URL for the user.
			
				def setUserURL(userUrl)
					@userUrl = userUrl
				end

				# * Get the user URL.
				#
				# ==== Returns
				# 
				# * user URL.
			
				def getUserURL
					return @userUrl
				end

				# * Convert the Project object into HashMap.
				#
				# ==== Returns
				# 
				# * HashMap object.

				def toParamMAP
					requestBody = Hash.new
					if name != nil
						requestBody["name"] = name
					end
					if description != nil
						requestBody["description"] = description
					end
					if status != nil
						requestBody["status"] = status
					end
					return requestBody
				end
		end
	end
end