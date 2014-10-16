#  $Id$ 
module Projects
	module Model
		# * This class is used to make an object for Milestone.

		class Milestone

			private
				attr_accessor :id, :name, :startDate, :startDateFormat, :startDateLong, :endDate, :endDateFormat, :endDateLong, :status, :ownerId, :ownerName, :flag, :url, :statusUrl
			
			public
			

				# * Set the milestone id.
				# 
				# ==== Parameters
				#  
				# * id:: - ID of the milestone.


				def setId(id)
					@id = id
				end

				# * Get the milestone id.
				#
				# ==== Returns
				#  
				# * Milestone id.
			
				def getId
					return @id
				end

				# * Set the milestone name.
				# 
				# ==== Parameters
				#  
				# * name:: - Name of the milestone.
			
				def setName(name)
					@name = name
				end

				# * Get the milestone name.
				#
				# ==== Returns
				#  
				# * Milestone name.
			
				def getName
					return name
				end

				# * Set the start date of the milestone.
				# 
				# ==== Parameters
				#  
				# * startDate:: - Start date of the milestone.
			
				def setStartDate(startDate)
					@startDate = startDate
				end

				# * Get the start date of the milestone.
				#
				# ==== Returns
				#  
				# * Start date of the milestone.
			
				def getStartDate
					return @startDate
				end

				# * Set the start date format of the milestone.
				# 
				# ==== Parameters
				# 
				# * startDateLong:: - Start date format of the milestone.
			
				def setStartDateFormat(startDateFormat)
					@startDateFormat = startDateFormat
				end

				# * Get the start date format.
				#
				# ==== Returns
				#  
				# * Start date format.

				def getStartDateFormat
					return @startDateFormat
				end

				# * Set the start date long of the milestone.
				# 
				# ==== Parameters
				#  
				# * startDateLong:: - Start date long of the milestone.
			
				def setStartDateLong(startDateLong)
					@startDateLong = startDateLong
				end

				# * Get the start date.
				#
				# ==== Returns
				# 
				# * Start date.
			
				def getStartDateLong
					return @startDateLong
				end

				# * Set the end date of the milestone.
				# 
				# ==== Parameters
				#  
				# * endDate:: - End date of the milestone.
			
				def setEndDate(endDate)
					@endDate = endDate
				end

				# * Get the end date of the milestone.
				#
				# ==== Returns
				#  
				# * End date of the milestone.
			
				def getEndDate
					return @endDate
				end

				# * Set the end date format.
				# 
				# ==== Parameters
				#  
				# * endDateLong:: - End date format of the milestone.
			
				def setEndDateFormat(endDateFormat)
					@endDateFormat = endDateFormat
				end

				# * Get the end date format.
				#
				# ==== Returns
				#  
				# * End date format.
			
				def getEndDateFormat
					return @endDateFormat
				end

				# * Set the end date long.
				# 
				# ==== Parameters
				#  
				# * endDateLong:: - End date long of the milestone.
			
				def setEndDateLong(endDateLong)
					@endDateLong = endDateLong
				end

				# * Get the end date.
				#
				# ==== Returns
				#  
				# * End date.
			
				def getEndDateLong
					return @endDateLong
				end

				# * Set the status of the milestone.
				# 
				# ==== Parameters
				# 
				# * status:: - Status of the milestone.
			
				def setStatus(status)
					@status = status
				end

				# * Get the status of the milestone.
				#
				# ==== Returns
				#  
				# * Milestone status.
			
				def getStatus
					return @status
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

				# * Set the flag for the milestone.
				# 
				# ==== Parameters
				#  
				# * flag:: - Flag for the milestone.
			
				def setFlag(flag)
					@flag = flag
				end

				# * Get the flag for the milestone.
				#
				# ==== Returns
				#  
				# * Flag for the milestone.
			
				def getFlag
					return @flag
				end

				# * Set the milestone URL.
				# 
				# ==== Parameters
				#  
				# * url:: - URL for the milestone.
			
				def setURL(url)
					@url = url
				end

				# * Get the milestone URL.
				#
				# ==== Returns
				#  
				# * Milestone URL.
			
				def getURL
					return @url
				end

				# * Set the status URL.
				# 
				# ==== Parameters
				#  
				# * statusUrl:: - Status URL for the milestone.
			
				def setStatusURL(statusUrl)
					@statusUrl = statusUrl
				end

				# * Get the status URL.
				#  
				# * status URL for the milestone.

				def getStatusURL
					return statusUrl
				end

				# * Convert the Milestone object into HashMap.
				#
				# ==== Returns
				# 
				# * HashMap object.
			
				def toParamMAP
					requestBody = Hash.new
				
					if name != nil
						requestBody["name"] = name
					end
					if startDate != nil
						requestBody["start_date"] = startDate
					end
					if endDate != nil
						requestBody["end_date"] = endDate
					end
					if ownerId != nil
						requestBody["owner"] = ownerId
					end
					if flag != nil
						requestBody["flag"] = flag
					end
					
					return requestBody
				end
		end
	end
end