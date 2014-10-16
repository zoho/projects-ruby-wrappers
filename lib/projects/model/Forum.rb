#  $Id$ 
module Projects
	module Model
		# * This class is used to make an object for Forum.

		class Forum

			private
				attr_accessor :id, :name, :content, :isStickyPost, :isAnnouncementPost, :postedBy, :postedPerson, :postDate, :postDateFormat, :postDateLong, :url, :categoryId, :notify, :uploadfile
			
			public
			
				# * Set the forum id.
				# 
				# ==== Parameters
				#  
				# * id:: - ID of the forum.

				def setId(id)
					@id = id
				end

				# * Get the forum id.
				#
				# ==== Returns
				#   
				# * Forum id.
				
				def getId
					return @id
				end

				# * Set the forum name.
				# 
				# ==== Parameters
				#  
				# * name:: - Name of the forum.
				
				def setName(name)
					@name = name
				end

				# * Get the forum name.
				#
				# ==== Returns
				#  
				# * Forum name.
				
				def getName
					return @name
				end

				# * Set the content of the forum.
				# 
				# ==== Parameters
				#  
				# * content:: - Content of the forum.
				
				def setContent(content)
					@content = content
				end

				# * Get the content of the forum.
				#
				# ==== Returns
				#   
				# * Content of the forum.
				
				def getContent
					return @content
				end

				# * Set the forum is a sticky post or not.
				# 
				# ==== Parameters
				#  
				# * isStickyPost:: - Is the forum in a sticky post or not.
				
				def setIsStickyPost(isStickyPost)
					@isStickyPost = isStickyPost
				end

				# * Get the forum is a sticky post or not.
				#
				# ==== Returns
				#  
				# * true, if the forum is in sticky post else returns false.
				
				def isStickyPost
					return @isStickyPost
				end

				# * Set is announcement post or not.
				# 
				# ==== Parameters
				#  
				# * isAnnouncementPost:: - is the post announcement or not.
				
				def setIsAnnouncementPost(isAnnouncementPost)
					@isAnnouncementPost = isAnnouncementPost
				end

				# * Get is the post is announcement or not.
				#
				# ==== Returns
				# 
				# * true, if the post is announcement else returns false.
				
				def isAnnouncementPost
					return @isAnnouncementPost
				end

				# * Set the id of the posted User.
				# 
				# ==== Parameters
				#  
				# * postedBy:: - Id of the User who posted the post.
				
				def setPostedBy(postedBy)
					@postedBy = postedBy
				end

				# * Get the id of the posted User.
				#
				# ==== Returns
				#   
				# * User id.
				
				def getPostedBy
					return @postedBy
				end

				# * Set the posted User name.
				# 
				# ==== Parameters
				#  
				# * postedPerson:: - Posted User name.	

				def setPostedPerson(postedPerson)
					@postedPerson = postedPerson
				end
				
				# * Get the posted User name.
				#
				# ==== Returns
				# 
				# * posted User name.
				
				def getPostedPerson
					return @postedPerson
				end

				# * Set the post date of the forum.
				# 
				# ==== Parameters
				# 
				# * postDate:: - Date of the post in the forum.
				
				def setPostDate(postDate)
					@postDate = postDate
				end

				# * Get the post date of the forum.
				#
				# ==== Returns
				#  
				# * Post date in the forum.
				
				def getPostDate
					return @postDate
				end

				# * Set the date format of the post in the forum.
				# 
				# ==== Parameters
				# 
				# * postDate:: - Date format of the post in the forum.
				
				def setPostDateFormat(postDateFormat)
					@postDateFormat = postDateFormat
				end

				# * Get the date format of the post in the forum.
				#
				# ==== Returns
				#   
				# * Date format of the post in the forum.
				
				def getPostDateFormat
					return @postDateFormat
				end

				# * Set the date of the post the forum.
				# 
				# ==== Parameters
				# 
				# * postDateLong:: - Date of the post in the forum.
				
				def setPostDateLong(postDateLong)
					@postDateLong = postDateLong
				end

				# * Get the date of the post in forum.
				#
				# ==== Returns
				#   
				# * Date of the post in the forum.
				
				def getPostDateLong
					return @postDateLong
				end

				# * Set the forum URL.
				# 
				# ==== Parameters
				#  
				# * url:: - URL for the forum.

				def setURL(url)
					@url = url
				end

				# * Get the forum URL.
				#
				# ==== Returns
				#   
				# * Forum URL.
				
				def getURL
					return @url
				end

				# * Set the category id of the project.
				# 
				# ==== Parameters
				#  
				# * categoryId:: - ID of the project category.
				
				def setCategoryId(categoryId)
					@categoryId = categoryId
				end

				# * Get the category id of the project.
				#
				# ==== Returns
				#  
				# * project category id. 
				
				def getCategoryId
					return @categoryId
				end

				# * Set the notify in the forum.
				# 
				# ==== Parameters
				#  
				# * notify:: - Notify in the forum.
				
				def setNotify(notify)
					@notify = notify
				end

				# * Get the notify of the forum.
				#
				# ==== Returns
				#  
				# * notify of the forum.
				
				def getNotify
					return @notify
				end

				# * Set the upload file list.
				# 
				# ==== Parameters
				#  
				# * uploadfile:: - ArrayList of Uploading file in the forum.
				
				def setUploadfile(uploadfile)
					@uploadfile = uploadfile
				end

				# * Get the uploaded file list.
				#
				# ==== Returns
				#  
				# * ArrayList of uploaded file for the post in the forum.
				
				def getUploadfile
					return @uploadfile
				end

				# * Convert the Forum object into HashMap.
				#
				# ==== Returns
				#
				# * HashMap object.
				
				def toParamMAP
					requestBody = Hash.new
					
					if name != nil
						requestBody["name"] = name
					end
					if content != nil
						requestBody["content"] = content
					end
					if categoryId != nil && categoryId.to_i > 0
						requestBody["category_id"] = categoryId
					end
					if notify != nil
						requestBody["notify"] = notify
					end
					
					
					return requestBody
				end
		end
	end
end