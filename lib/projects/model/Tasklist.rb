#  $Id$ 
module Projects
	module Model
		# * This class is used to make an object for Tasklist.

		class Tasklist

			private
				attr_accessor :id, :idString, :name, :completed, :createdTime, :createdTimeFormat, :createdTimeLong, :rolled, :sequence, :url, :taskUrl, :flag, :status, :milestone
			
			public

				# * Set the task list id.
				# 
				# ==== Parameters
				#  
				# * id:: - ID of the task list.

				def setId(id)
					@id = id
				end

				# * Get the task list id.
				#
				# ==== Returns
				# 
				# * Task list id.
				
				def getId
					return @id
				end
				
				# * Set the tasklist id string.
				#
				# ==== Parameters
				#
				# * idString::- Tasklist id string.
				
				def setIdString(idString)
					
					@idString = idString
				
				end
				
				# * Get the tasklist id string.
				#
				# ==== Returns
				#
				# * Returns the tasklist id string.
				
				def getIdString
				
					return @idString
					
				end

				# * Set the task list name.
				# 
				# ==== Parameters
				# 
				# * name:: - Name of the task list.
				
				def setName(name)
					@name = name
				end

				# * Get the task list name.
				#
				# ==== Returns
				#  
				# * task list name.
				
				def getName
					return @name
				end

				# * Set whether the task list is completed or not.
				# 
				# ==== Parameters
				# 
				# * completed:: - Whether the task list is completed or not.
				
				def setCompleted(completed)
					@completed = completed
				end

				# * Get whether the task list is completed or not.
				#
				# ==== Returns
				#  
				# * true, if the task list is completed else returns false.
				
				def isCompleted
					return @completed
				end

				# * Set the task list created time.
				# 
				# ==== Parameters
				#  
				# * createdTime:: - Task list created time.
				
				def setCreatedTime(createdTime)
					@createdTime = createdTime
				end

				# * Get the task list created time.
				#
				# ==== Returns
				#  
				# * Task list created time.
				
				def getCreatedTime
					return @createdTime
				end

				# * Set the task list created time format.
				# 
				# ==== Parameters
				#  
				# * createdTime:: - Task list created time format.
				
				def setCreatedTimeFormat(createdTimeFormat)
					@createdTimeFormat = createdTimeFormat
				end

				# * Get the task list created time format.
				#
				# ==== Returns
				#   
				# * Task list created time format.
				
				def getCreatedTimeFormat
					return @createdTimeFormat
				end

				# * Set the task list created time long.
				# 
				# ==== Parameters
				# 
				# * createdTimeLong:: - Task list created time long.
				
				def setCreatedTimeLong(createdTimeLong)
					@createdTimeLong = createdTimeLong
				end

				# * Get the task list created time long.
				#
				# ==== Returns
				#   
				# * Task list created time long.
				
				def getCreatedTimeLong
					return @createdTimeLong
				end

				# * Set whether the task list is rolled or not.
				# 
				# ==== Parameters
				#  
				# * rolled:: - Whether the task list is rolled or not.
				
				def setRolled(rolled)
					@rolled = rolled
				end

				# * Get whether the task list rolled or not.
				#
				# ==== Returns
				#  
				# * true, if the task list is rolled else returns false.
				
				def isRolled
					return rolled
				end

				# * Set the sequence of the task list.
				# 
				# ==== Parameters
				#  
				# * sequence:: - Sequence of the task list.
				
				def setSequence(sequence) 
					@sequence = sequence
				end

				# * Get the sequence of the task list.
				#
				# ==== Returns
				#   
				# * Sequence of the task list.
				
				def getSequence
					return @sequence
				end

				# * Set the task list URL.
				# 
				# ==== Parameters
				#  
				# * url:: - URL for the task list.		

				def setURL(url)
					@url = url
				end

				# * Get the task list URL.
				#
				# ==== Returns
				# 
				# * Task list URL.
				
				def getURL
					return @url
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
				# * Task URL.
				
				def getTaskURL
					return @taskUrl
				end

				# * Set the flag for the task list.
				# 
				# ==== Parameters
				#  
				# * flag:: - Flag for the task list.
				
				def setFlag(flag)
					@flag = flag
				end

				# * Get the flag for the task list.
				#
				# ==== Returns
				#  
				# * Task list flag.
				
				def getFlag
					return @flag
				end

				# * Set the status of the task list.
				# 
				# ==== Parameters
				#  
				# * status:: - Status of the task list.
				
				def setStatus(status)
					@status = status
				end

				# * Get the status of the task list.
				#
				# ==== Returns
				#   
				# * Status of the task list. 
				
				def getStatus
					return @status
				end

				# * Set the milestone for the task list.
				# 
				# ==== Parameters
				#  
				# * milestone:: - Milestone object.
				
				def setMilestone(milestone)
					@milestone = milestone
				end

				# * Get the milestone for the task list.
				#
				# ==== Returns
				#   
				# * Milestone object.
				
				def getMilestone
					return @milestone
				end
				
				# * Convert the Tasklist object into HashMap.
				#
				# ==== Returns
				#  
				# * HashMap object.
				
				def toParamMAP
					requestBody = Hash.new
					
					if milestone != nil
						requestBody["milestone_id"] = milestone.getId
					end
					if name != nil
						requestBody["name"] = name
					end
					if flag != nil
						requestBody["flag"] = flag
					end
					if status != nil
						requestBody["status"] = status
					end
					
					return requestBody
				end

		end
	end
end
