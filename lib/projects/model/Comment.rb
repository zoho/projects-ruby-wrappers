#  $Id$ 
module Projects
	module Model
		# * This class is used to make an object for Comment.

		class Comment

			private
				attr_accessor :id, :content, :createdTime, :createdTimeFormat, :createdTimeLong, :addedBy, :addedPerson, :updatedBy, :postedBy, :postedPerson, :postDate, :postDateFormat, :postDateLong
			
			public

				# * Set the comment id.
				# 
				# ==== Parameters
				# 
				# * id:: - ID of the comment.

				def setId(id)
					@id = id
				end

				# * Get the comment id.
				#
				# ==== Returns
				#   
				# * Comment id.
				
				def getId
					return @id
				end

				# * Set the comment content.
				# 
				# ==== Parameters
				#  
				# * content:: - Content for the comment.
				
				def setContent(content)
					@content = content
				end

				# * Get the comment content.
				#
				# ==== Returns
				#   
				# * Comment content.
				
				def getContent
					return @content
				end

				# * Set the created time.
				# 
				# ==== Parameters
				#  
				# * createdTime:: - Created time for the comment.
				
				def setCreatedTime(createdTime)
					@createdTime = createdTime
				end

				# * Get the created time.
				#
				# ==== Returns
				#   
				# * Created time.
				
				def getCreatedTime
					return @createdTime
				end

				# * Set the created time format.
				# 
				# ==== Parameters
				#  
				# * createdTime:: - Created time format for the comment.
				
				def setCreatedTimeFormat(createdTimeFormat)
					@createdTimeFormat = createdTimeFormat
				end

				# * Get the created time format.
				#
				# ==== Returns
				#   
				# * Created time format.
				
				def getCreatedTimeFormat
					return @createdTimeFormat
				end

				# * Set the created time long.
				# 
				# ==== Parameters
				#  
				# * createdTimeLong:: - Created time for the comment.
				
				def setCreatedTimeLong(createdTimeLong)
					@createdTimeLong = createdTimeLong
				end

				# * Get the created time long.
				#
				# ==== Returns
				#   
				# * Created time.
				
				def getCreatedTimeLong
					return @createdTimeLong
				end

				# * Set the id for the comment added person.
				# 
				# ==== Parameters
				# 
				# * addedBy:: - ID of the person who added the comment.
				
				def setAddedBy(addedBy)
					@addedBy = addedBy
				end

				# * Get the comment added person id.
				#
				# ==== Returns
				#  
				# * Id of the person who added the comment.
				
				def getAddedBy
					return @addedBy
				end

				# * Set the comment added person.
				# 
				# ==== Parameters
				#  
				# * addedPerson:: - Person who added comment.

				def setAddedPerson(addedPerson)
					@addedPerson = addedPerson
				end
			
				# * Get the comment added person.
				#
				# ==== Returns
				#   
				# * Person who added comment.

				def getAddedPerson
					return @addedPerson
				end

				# * Set the comment updated person id.
				# 
				# ==== Parameters
				#  
				# * updatedBy:: - ID of the person who updated the comment.

				
				def setUpdatedBy(updatedBy)
					@updatedBy = updatedBy
				end

				# * Get the comment updated person id.
				#
				# ==== Returns
				#  
				# * Id of the person who updated the comment.
				
				def getUpdatedBy
					return @updatedBy
				end

				# * Set the comment posted person id.
				# 
				# ==== Parameters
				# 
				# * postedBy:: - Id of the person who posted the comment.
				
				def setPostedBy(postedBy)
					@postedBy = postedBy
				end

				# * Get the comment posted person id.
				#
				# ==== Returns
				#  
				# * Id of the person who posted the comment.
				
				def getPostedBy
					return @postedBy
				end

				# * Set the comment posted person.
				# 
				# ==== Parameters
				#  
				# * postedPerson:: - Person who posted the comment.
				
				def setPostedPerson(postedPerson)
					@postedPerson = postedPerson
				end

				# * Get the comment posted person.
				#
				# ==== Returns
				#  
				# * Person who posted the comment.
				
				def getPostedPerson
					return @postedPerson
				end

				# * Set the comment posted date.
				# 
				# ==== Parameters
				#  
				# * postDate:: - Date at which comment is posted.
				
				def setPostDate(postDate)
					@postDate = postDate
				end

				# * Get the comment posted date.
				#
				# ==== Returns
				#   
				# * Date at which comment is posted.
				
				def getPostDate
					return @postDate
				end

				# * Set the comment posted date format.
				# 
				# ==== Parameters
				#  
				# * postDate:: - Date format of the posted comment.
				
				def setPostDateFormat(postDateFormat)
					@postDateFormat = postDateFormat
				end

				# * Get the comment posted date format.
				#
				# ==== Returns
				#   
				# * Date format of the posted comment.
				
				def getPostDateFormat
					return @postDateFormat
				end

				# * Set the comment posted date long.
				# 
				# ==== Parameters
				# 
				# * postDateLong:: - Was was the comment posted(date).
				
				def setPostDateLong(postDateLong)
					@postDateLong = postDateLong
				end

				# * Get the comment posted date long.
				#
				# ==== Returns
				#  
				# * The date on which the comment is posted.
				
				def getPostDateLong
					return @postDateLong
				end
				
				# * Convert the Comment object into HashMap.
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