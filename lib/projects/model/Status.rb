#  $Id$ 
module Projects
	module Model
		# * This class is used to make an object for Status.

		class Status

			private
				attr_accessor :id, :content, :postedBy, :postedPerson, :postedTime, :postedTimeLong, :postedTimeFormat

			public

				# * Set the status id.
				# 
				# ==== Parameters
				#  
				# * id:: - ID of the status.

				def setId(id)
					@id = id
				end

				# * Get the status id.
				#
				# ==== Returns
				#  
				# * status id.

				def getId
					return @id
				end

				# * Set the status content.
				# 
				# ==== Parameters
				# 
				# * content:: - Content for the status.
			
				def setContent(content)
					@content = content
				end

				# * Get the status content.
				#
				# ==== Returns
				#  
				# * Status content.
			
				def getContent
					return @content
				end

				# * Set the status posted person id.
				# 
				# ==== Parameters
				# 
				# * postedBy:: - ID of the person who posted the status.
			
				def setPostedBy(postedBy)
					@postedBy = postedBy
				end

				# * Get the status posted person id.
				#
				# ==== Returns
				#  
				# * Id of the person who posted the status.
			
				def getPostedBy
					return @postedBy
				end

				# * Set the status posted person name.
				# 
				# ==== Parameters
				#  
				# * postedPerson:: - Name of the person who posted the status.
			
				def setPostedPerson(postedPerson)
					@postedPerson = postedPerson
				end

				# * Get the status posted person name.
				#
				# ==== Returns
				#
				# * Name of the person who posted the status.
			
				def getPostedPerson()
					return @postedPerson
				end

				# * Set the status posted time.
				# 
				# ==== Parameters
				#  
				# * postedTime:: - Status posted time.
			
				def setPostedTime(postedTime)
					@postedTime = postedTime
				end

				# * Get the status posted time.
				#
				# ==== Returns
				#  
				# * Status poted time.
			
				def getPostedTime
					return @postedTime
				end

				# * Set the status posted time long.
				# 
				# ==== Parameters
				#  
				# * postedTimeLong:: - Status posted time long.
			
				def setPostedTimeLong(postedTimeLong)
					@postedTimeLong = postedTimeLong
				end

				# * Get the status posted time long.
				#
				# ==== Returns
				#  
				# * status posted time long.
			
				def getPostedTimeLong
					return @postedTimeLong
				end

				# * Set the status posted time format.
				# 
				# ==== Parameters
				#  
				# * postedTimeLong:: - Status posted time format.
			
				def setPostedTimeFormat(postedTimeFormat)
					@postedTimeFormat = postedTimeFormat
				end

				# * Get the status posted time format.
				#
				# ==== Returns
				#  
				# * status posted time format.
			
				def getPostedTimeFormat
					return @postedTimeFormat
				end

				# * Convert the Status object into HashMap.
				#
				# ==== Returns
				# 
				# * HashMap object.

				def toParamMAP
					requestBody = Hash.new
					if content != nil
						requestBody["content"] = content
					end
					return requestBody
				end
		end
	end
end