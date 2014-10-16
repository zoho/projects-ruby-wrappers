#  $Id$ 
module Projects
	module Model
		# * This class is used to make an object for Bug.

		class Bug 

			private 
				attr_accessor :id, :key, :projectId, :flag, :title, :description, :reporterId, :reportedPerson, :createdTime, :createdTimeFormat, :createdTimeLong, :assigneeId, :assigneeName, :closed, :url, :timesheetUrl, :classificationId, :classificationType, :severityId, :severityType, :statusId, :statusType, :reproducibleId, :reproducibleType, :moduleId, :moduleName, :milestoneId, :dueDate, :dueDateFormat, :dueDateLong;
			
			public

				# * Set the bug id.
				# 
				# ==== Parameters
				# 
				# * id:: - ID of the bug.

				def setId(id)
					@id = id
				end

				# * Get the bug id.
				#
				# ==== Returns
				#  
				# * Bug id.


				def getId
					return @id
				end

				# * Set the key for the bug.
				# 
				# ==== Parameters
				#  
				# * key:: - Key for the bug.


				def setKey(key)
					@key = key
				end

				# * Get the key for the bug.
				#
				# ==== Returns
				# 
				# * Bug key.


				def getKey
					return @key
				end

				# * Set the project id.
				# 
				# ==== Parameters
				#  
				# * projectId:: - ID of the project.


				def setProjectId(projectId)
					@projectId = projectId
				end

				# * get the project id.
				#
				# ==== Returns
				#  
				# * Project id.


				def getProjectId
					return @projectId
				end

				# * Set the flag for the bug.
				# 
				# ==== Parameters
				# 
				# * flag:: - Flag for the bug.


				def setFlag(flag)
					@flag = flag
				end

				# * Get the flag for the bug.
				#
				# ==== Returns
				#  
				# * Flag of the bug.

				def getFlag
					return @flag
				end

				# * Set the bug title.
				# 
				# ==== Parameters
				#  
				# * title:: - Title for the bug.


				def setTitle(title)
					@title = title
				end

				# * Get the bug title.
				#
				# ==== Returns
				#  
				# * Bug title.


				def getTitle
					return @title
				end

				# * Set the bug description.
				# 
				# ==== Parameters
				#  
				# * description:: - Description for the bug.


				def setDescription(description)
					@description = description
				end

				# * Get the bug description.
				#
				# ==== Returns
				#  
				# * Bug description.


				def getDescription
					return @description
				end

				# * Set the reporter id.
				# 
				# ==== Parameters
				#  
				# * reporterId:: - ID of the reporter.


				def setReporterId(reporterId)
					@reporterId = reporterId
				end

				# * Get the reporter id.
				#
				# ==== Returns
				# 
				# * Reporter id.


				def getReporterId
					return @reporterId
				end

				# * Set the reported person.
				# 
				# ==== Parameters
				#  
				# * reportedPerson:: - Person who is reporting the bug.


				def setReportedPerson(reportedPerson)
					@reportedPerson = reportedPerson
				end

				# * Get the reported person.
				#
				# ==== Returns
				#  
				# * Person who reported the bug.


				def getReportedPerson
					return @reportedPerson
				end

				# * Set the created time.
				# 
				# ==== Parameters
				# 
				# * createdTime:: - Created time for the bug.


				def setCreatedTime(createdTime)
					@createdTime = createdTime
				end

				# * Get the created time.
				#
				# ==== Returns
				#  
				# * created time for the bug.


				def getCreatedTime
					return @createdTime
				end

				# * Set the created time format.
				# 
				# ==== Parameters
				# 
				# * createdTime:: - Created time format for the bug.


				def setCreatedTimeFormat(createdTimeFormat)
					@createdTimeFormat = createdTimeFormat
				end

				# * Get the created time format.
				#
				# ==== Returns
				#  
				# * Created time format for the bug.


				def getCreatedTimeFormat
					return @createdTimeFormat
				end

				# * Set the created time long.
				# 
				# ==== Parameters
				#  
				# * createdTimeLong:: - Created time for the bug.


				def setCreatedTimeLong(createdTimeLong)
					@createdTimeLong = createdTimeLong
				end

				# * Get the created time long.
				#
				# ==== Returns
				#  
				# * Created time for the bug.


				def getCreatedTimeLong
					return @createdTimeLong
				end

				# * Set the assignee id for the bug.
				# 
				# ==== Parameters
				#  
				# * assigneeId:: - ID of the assignee.


				def setAssigneeId(assigneeId)
					@assigneeId = assigneeId
				end

				# * Get the assignee id.
				#
				# ==== Returns
				#  
				# * Assignee id.

				def getAssigneeId
					return @assigneeId
				end

				# * Set the assignee name.
				# 
				# ==== Parameters
				#  
				# * assigneeName:: - Name of the assignee.


				def setAssigneeName(assigneeName)
					@assigneeName = assigneeName
				end

				# * Get the assignee name.
				#
				# ==== Returns
				#  
				# * Assignee name.


				def getAssigneeName
					return @assigneeName
				end

				# * Set the bug is closed or not.
				# 
				# ==== Parameters
				#  
				# * closed:: - Bug is closed or not.


				def setClosed(closed)
					@closed = closed
				end

				# * Get the bug is closed or not.
				#
				# ==== Returns
				#  
				# * true, if the big is closed else returns false.


				def isClosed
					return @closed
				end

				# * Set the bug URL.
				# 
				# ==== Parameters
				#  
				# * url:: - URL for the bug.


				def setURL(url)
					@url = url
				end

				# * Get the bug URL.
				#
				# ==== Returns
				#  
				# * Bug URL.


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

				# * Set the classification id.
				# 
				# ==== Parameters
				#  
				# * classificationId:: - ID of the classification.

				def setClassificationId(classificationId)
					@classificationId = classificationId
				end

				# * Get the classification id.
				#
				# ==== Returns
				#  
				# * Classification id.

				def getClassificationId
					return @classificationId
				end

				# * Set the classification type.
				# 
				# ==== Parameters
				#  
				# * classificationType:: - Type of the classification.


				def setClassificationType(classificationType)
					@classificationType = classificationType
				end

				# * Get the classification type.
				#
				# ==== Returns
				#  
				# * Classification type.


				def getClassificationType
					return @classificationType
				end

				# * Set the severity id.
				# 
				# ==== Parameters
				#  
				# * severityId:: - ID of the severity.


				def setSeverityId(severityId)
					@severityId = severityId
				end

				# * Get the severity id.
				#
				# ==== Returns
				#   
				# * Severity id.


				def getSeverityId
					return @severityId
				end

				# * Set the severity type.
				# 
				# ==== Parameters
				#  
				# * severityType:: - Type of the severity.


				def setSeverityType(severityType)
					@severityType = severityType
				end

				# * Get the severity type.
				#
				# ==== Returns
				#   
				# * Severity type.


				def getSeverityType
					return @severityType
				end

				# * Set the status id.
				# 
				# ==== Parameters
				#  
				# * statusId:: - ID of the status.


				def setStatusId(statusId)
					@statusId = statusId
				end

				# * Get the status id.
				#
				# ==== Returns
				#   
				# * Status id.

				def getStatusId
					return @statusId
				end

				# * Set the status type.
				# 
				# ==== Parameters
				#  
				# * statusType:: - Type of the status.


				def setStatusType(statusType)
					@statusType = statusType
				end

				# * Get the status type.
				#
				# ==== Returns
				#   
				# * Status type.


				def getStatusType
					return @statusType
				end

				# * Set the reproducible id.
				# 
				# ==== Parameters
				# 
				# * reproducibleId:: - Reproducible id of the bug.


				def setReproducibleId(reproducibleId)
					@reproducibleId = reproducibleId
				end

				# * Get the reproducible id.
				#
				# ==== Returns
				#  
				# * Reproducible id of the bug.


				def getReproducibleId
					return @reproducibleId
				end

				# * Set the reproducible type.
				# 
				# ==== Parameters
				#  
				# * reproducibleType:: - Reproducible type of the bug.


				def setReproducibleType(reproducibleType)
					@reproducibleType = reproducibleType
				end

				# * Get the reproducible type.
				#
				# ==== Returns
				#   
				# * Reproducible type of the bug.


				def getReproducibleType
					return @reproducibleType
				end

				# * Set the module id.
				# 
				# ==== Parameters
				# 
				# * moduleId:: - ID of the module.

				def setModuleId(moduleId)
					@moduleId = moduleId
				end

				# * Get the module id.
				#
				# ==== Returns
				#   
				# * Module id.

				def getModuleId
					return @moduleId
				end

				# * Set the module name.
				# 
				# ==== Parameters
				#  
				# * moduleName:: - Name of the module.

				def setModuleName(moduleName)
					@moduleName = moduleName
				end

				# * Get the module name.
				#
				# ==== Returns
				#   
				# * Module name.

				def getModuleName
					return @moduleName
				end

				# * Set the milestone id.
				# 
				# ==== Parameters
				#  
				# * milestoneId:: - ID of the milestone.

				def setMilestoneId(milestoneId)
					@milestoneId = milestoneId
				end


				# * Get the milestone id.
				#
				# ==== Returns
				#   
				# * Milestone id.

				def getMilestoneId
					return @milestoneId
				end
			
				# * Set the due date.
				# 
				# ==== Parameters
				#  
				# * dueDate:: - Due date for the bug.

				def setDueDate(dueDate)
					@dueDate = dueDate
				end
			
				# * Get the due date.
				#
				# ==== Returns
				#   
				# * Due date.

				def getDueDate
					return @dueDate
				end
			
				# * Set the due date format.
				# 
				# ==== Parameters
				#  
				# * dueDate:: - Due date format for the bug.

				def setDueDateFormat(dueDateFormat)
					@dueDateFormat = dueDateFormat
				end
			
				# * Get the due date format.
				#
				# ==== Returns
				#   
				# * Due date format.

				def getDueDateFormat
					return @dueDateFormat
				end
			
				# * Set the due date long.
				# 
				# ==== Parameters
				#  
				# * dueDateLong:: - Due date for the bug.

				def setDueDateLong(dueDateLong)
					@dueDateLong = dueDateLong
				end
					
				# * Get the due date long.
				#
				# ==== Returns
				#   
				# * Due date.

				def getDueDateLong
					return @dueDateLong
				end
			
				# * Convert the Bug object into HashMap.
				#
				# ==== Returns
				# 
				# * HashMap object.
					
				def toParamMAP

					requestBody = Hash.new			
					
					if title != nil
						requestBody["title"] = title
					end
					if description != nil
						requestBody["description"] = description
					end
					if assigneeId != nil
						requestBody["assignee"] = assigneeId
					end
					if flag != nil
						requestBody["flag"] = flag
					end
					if classificationId != nil && classificationId > 0
						requestBody["classification_id"] = classificationId
					end
					if milestoneId != nil && milestoneId > 0
						requestBody["milestone_id"] = milestoneId
					end
					if dueDate != nil
						requestBody["due_date"] = dueDate
					end
					if moduleId != nil && moduleId > 0
						requestBody["module_id"] = moduleId
					end
					if severityId != nil && severityId > 0
						requestBody["severity_id"] = severityId
					end
					if reproducibleId != nil && reproducibleId > 0
						requestBody["reproducible_id"] = reproducibleId
					end
					
					return requestBody
				end
		end
	end
end