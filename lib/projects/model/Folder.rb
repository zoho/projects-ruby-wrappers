#  $Id$ 
module Projects
	module Model
		# * This class is used to make an object for Folder.

		class Folder 

			private
				attr_accessor :id, :name, :isDiscussion, :url

			public
			
				# * Set the folder id.
				# 
				# ==== Parameters
				#  
				# * id:: - ID of the folder.

				def setId(id)
					@id = id
				end

				# * Get the folder id.
				#
				# ==== Returns
				#   
				# * Folder id.
				
				def getId
					return @id
				end

				# * Set the folder name.
				# 
				# ==== Parameters
				#  
				# * name:: - Name of the folder.
				
				def setName(name)
					@name = name
				end

				# * Get the folder name.
				#
				# ==== Returns
				#   
				# * Folder name.
				
				def getName
					return @name
				end

				# * Set the folder is in discussion or not.
				# 
				# ==== Parameters
				#   
				# * isDiscussion:: - Is the folder is in discussion or not.
				
				def setIsDicussion(isDiscussion)
					@isDiscussion = isDiscussion
				end

				# * Get the folder is in discussion or not.
				#
				# ==== Returns
				#   
				# * true, if thew folder is in discussion else false.
				
				def isDiscussion
					return @isDiscussion
				end

				# * Set the folder URL.
				# 
				# ==== Parameters
				#  
				# * url:: - URL for the folder.
				
				def setURL(url)
					@url = url
				end

				# * Get the folder URL.
				#
				# ==== Returns
				#   
				# * Folder URL.
				
				def getURL
					return @url
				end

				# * Convert the Folder object into HashMap.
				#
				# ==== Returns
				#  
				# * HashMap object.
				
				def toParamMAP
					requestBody = Hash.new
					
					if name != nil
						requestBody["name"] = name
					end
					
					return requestBody
				end
		end
	end
end