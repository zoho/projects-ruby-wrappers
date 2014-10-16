#  $Id$ 
module Projects
	module Model
		# * This class is used to make an object for Document.

		class Document

			private
				attr_accessor :id, :filename, :contenttype, :url, :versions, :uploaddoc, :folderId, :description, :tags, :notify, :folder
			
			public
			
				# * Set the document id.
				# 
				# ==== Parameters
				#  
				# * id:: - ID of the document.

				def setId(id)
					@id = id
				end

				# * Get the document id.
				#
				# ==== Returns
				#   
				# * Document id.
				
				def getId
					return @id
				end

				# * Set the file name.
				# 
				# ==== Parameters
				#  
				# * filename:: - Name of the file.
				
				def setFilename(filename)
					@filename = filename
				end

				# * Get the file name.
				#
				# ==== Returns
				#   
				# * File name.

				
				def getFilename
					return @filename
				end

				# * Set the content type.
				# 
				# ==== Parameters
				# 
				# * contenttype:: - Content type of the file.
				
				def setContenttype(contenttype)
					@contenttype = contenttype
				end

				# * Get the content type.
				#
				# ==== Returns
				#   
				# * Content type of the file.
				
				def getContenttype
					return @contenttype
				end

				# * Set the document URL.
				# 
				# ==== Parameters
				# 
				# * url:: - URL for the document.

				def setURL(url)
					@url = url
				end

				# * Get the document URL.
				#
				# ==== Returns
				#   
				# * Document URL.
				
				def getURL
					return @url
				end

				# * Set the document version.
				# 
				# ==== Parameters
				# 
				# * versions:: - Version for the document.
				
				def setVersions(versions)
					@versions = versions
				end

				# * Get the document version.
				#
				# ==== Returns
				#   
				# * Document version.
				
				def getVersions
					return @versions
				end

				# * Set the upload document file.
				# 
				# ==== Parameters
				# 
				# * uploaddoc:: - ArrayList of the documents being uploaded.
				
				def setUploaddoc(uploaddoc)
					@uploaddoc = uploaddoc
				end

				# * Get the upload document file.
				#
				# ==== Returns
				#   
				# * ArrayList of upload document file.
				
				def getUploaddoc
					return @uploaddoc
				end

				# * Set the folder id.
				# 
				# ==== Parameters
				# 
				# * folderId:: - ID of the folder.
				
				def setFolderId(folderId)
					@folderId = folderId
				end

				# * Get the folder id.
				#
				# ==== Returns
				#  
				# * Folder id.
				
				def getFolderId
					return @folderId
				end

				# * Set the description of the document.
				# 
				# ==== Parameters
				#  
				# * description:: - Description of the document.
				
				def setDescription(description)
					@description = description
				end

				# * Get the description of the document.
				#
				# ==== Returns
				#   
				# * Document description.

				def getDescription
					return @description
				end

				# * Set the tags for the document.
				# 
				# ==== Parameters
				#  
				# * tags:: - Tags for the document.
				
				def setTags(tags)
					@tags = tags
				end

				# * Get the tags for the document.
				#
				# ==== Returns
				#   
				# * Tags for the document.
				
				def getTags
					return @tags
				end

				# * Set the notify for the document.
				# 
				# ==== Parameters
				# 
				# * notify:: - Notify for the document. 
				
				def setNotify(notify)
					@notify = notify
				end

				# * Get the notify for the document.
				#
				# ==== Returns
				# 
				# * Notify for the document.
				
				def getNotify
					return @notify
				end

				# * Set the folder.
				# 
				# ==== Parameters
				#  
				# * folder:: - Folder object.
				
				def setFolder(folder)
					@folder = folder
				end

				# * Get the folder object.
				#
				# ==== Returns
				#   
				# * Folder object.
				
				def getFolder
					return @folder
				end
				
				# * Convert the Document object into HashMap.
				#
				# ==== Returns
				#  
				# * HashMap object.

				def toParamMAP
					requestBody = Hash.new
					
					if folderId != nil && folderId.to_i > 0
						requestBody["folder_id"] = folderId
					end
					if description != nil
						requestBody["description"] = description
					end
					if tags != nil
						requestBody["tags"] = tags
					end
					if notify != nil && notify.to_i > 0
						requestBody["notify"] = notify
					end
					
					return requestBody
				end
		end
	end
end