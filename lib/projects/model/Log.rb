#  $Id$ 
module Projects
	module Model
		# * This class is used to make an object for Log.

		class Log 
			
			private 
				attr_accessor :id, :notes, :hours, :minutes, :hoursDisplay, :totalMinutes, :ownerId, :ownerName, :billStatus, :projectId, :projectName, :url, :logDate, :logDateFormat, :logDateLong
			
			public
			
				# * Set the log id.
				# 
				# ==== Parameters
				# 
				# * id:: - ID of the log.

				def setId(id)
					@id = id
				end

				# * Get the log id.
				#
				# ==== Returns
				#  
				# * Log id.
				
				def getId
					return @id
				end

				# * Set the notes for the log.
				# 
				# ==== Parameters
				#  
				# * notes:: - Notes for the log.
				
				def setNotes(notes)
					@notes = notes
				end

				# * Get the log notes.
				#
				# ==== Returns
				#  
				# * Log notes.	

				def getNotes
					return @notes
				end

				# * Set the hours for the log.
				# 
				# ==== Parameters
				#  
				# * hours:: - Hours for the log.
				
				def setHours(hours)
					@hours = hours
				end

				# * Get the hours for the log.
				#
				# ==== Returns
				# 
				# * Log hours.
				
				def getHours
					return @hours
				end

				# * Set the minutes for the log.
				# 
				# ==== Parameters
				#  
				# * minutes:: - Minutes for the log.
				
				def setMinutes(minutes)
					@minutes = minutes
				end

				# * Get the minutes for the log.
				#
				# ==== Returns
				#  
				# * Log minutes.
				
				def getMinutes
					return @minutes
				end

				# * Set the hour display format.
				# 
				# ==== Parameters
				#  
				# * hourDisplay:: - Hour display format.
				
				def setHoursDisplay(hoursDisplay)
					@hoursDisplay = hoursDisplay
				end

				# * Get the hour display format.
				#
				# ==== Returns
				#  
				# * Hour display format.
				
				def getHoursDisplay
					return @hoursDisplay
				end

				# * Set the total time in minutes for the log.
				# 
				# ==== Parameters
				#  
				# * totalMinutes:: - Total time in minutes for the log.
				
				def setTotalMinutes(totalMinutes)
					@totalMinutes = totalMinutes
				end

				# * Get the total time in minutes for the log.
				#
				# ==== Returns
				#  
				# * Total time in minutes for the log.
				
				def getTotalMinutes
					return @totalMinutes
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
				# * Owner name.
				
				def getOwnerName
					return @ownerName
				end

				# * Set the bill status for the log.
				# 
				# ==== Parameters
				#  
				# * billStatus:: - Bill status for the log.
				
				def setBillStatus(billStatus)
					@billStatus = billStatus
				end

				# * Get the bill status for the log.
				#
				# ==== Returns
				# 
				# * Bill status.
				
				def getBillStatus
					return @billStatus
				end

				# * Set the project id.
				# 
				# ==== Parameters
				#  
				# * projectId:: - ID of the project.
				
				def setProjectId(projectId)
					@projectId = projectId
				end

				# * Get the project id.
				#
				# ==== Returns
				#  
				# * Project id.
				
				def getProjectId
					return @projectId
				end

				# * Set the project name.
				# 
				# ==== Parameters
				#  
				# * projectName:: - Name of the project.
				
				def setProjectName(projectName)
					@projectName = projectName
				end

				# * Get the project name.
				#
				# ==== Returns
				#  
				# * Project name.
				
				def getProjectName
					return @projectName
				end

				# * Set the URL for the log.
				# 
				# ==== Parameters
				#  
				# * url:: - URL for the log.
				
				def setURL(url)
					@url = url
				end

				# * Get the URL.
				#
				# ==== Returns
				#  
				# * Log URL.
				
				def getURL
					return @url
				end

				# * Set the log date.
				# 
				# ==== Parameters
				# 
				# * logDate:: - Date of the log.
				
				def setLogDate(logDate)
					@logDate = logDate
				end

				# * Get the log date.
				#
				# ==== Returns
				#  
				# * Log date.
				
				def getLogDate
					return @logDate
				end

				# * Set the log date format.
				# 
				# ==== Parameters
				#  
				# * logDate:: - Date format of the log.
				
				def setLogDateFormat(logDateFormat)
					@logDateFormat = logDateFormat
				end

				# * Get the log date format.
				#
				# ==== Returns
				#  
				# * Log date format.
				
				def getLogDateFormat
					return @logDateFormat
				end

				# * Set the log date.
				# 
				# ==== Parameters
				#  
				# * logDateLong:: - Date for the log.
				
				def setLogDateLong(logDateLong)
					@logDateLong = logDateLong
				end

				# * Get the log date.
				#
				# ==== Returns
				#  
				# * Log date.
				
				def getLogDateLong
					return @logDateLong
				end

				# * Set the log date.
				# 
				# ==== Parameters
				#  
				# * date:: - Date for the log.
				
				def setDate(date)
					@logDate = date
				end

				# * Get the log date.
				#
				# ==== Returns
				# 
				# * Log date.
				
				def getDate
					return @logDate
				end
			
				# * Convert the Log object into HashMap.
				#
				# ==== Returns
				# 
				# * HashMap object.

				def toParamMAP
					requestBody = Hash.new
					
					if logDate != nil
						requestBody["date"] = logDate
					end
					if billStatus != nil
						requestBody["bill_status"] = billStatus
					end
					if hours != nil
						requestBody["hours"] = hours
					end
					if notes != nil
						requestBody["notes"] = notes
					end
					
					return requestBody
				end
		end
	end
end