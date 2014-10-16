#  $Id$ 
module Projects
	module Model
		# * This class is used to make an object for Version.

		class Version 

			private
				attr_accessor :id, :uploadedBy, :description, :version, :uploadedOn, :fileSize, :uploadedDate, :uploadedDateFormat, :uploadedDateLong
			
			public

				# * Set the version id.
				# 
				# ==== Parameters
				#  
				# * id:: - ID of the version.

				def setId(id)
					@id = id
				end

				# * Get the version id.
				#
				# ==== Returns
				#   
				# * Version id.
				
				def getId
					return @id
				end

				# * Set the id of the person who has uploaded.
				# 
				# ==== Parameters
				# 
				# * uploadedBy:: - Id of the person who has uploaded.
				
				def setUploadedBy(uploadedBy)
					@uploadedBy = uploadedBy
				end

				# * Get the id of the person who has uploaded.
				#
				# ==== Returns
				# 
				# * Id of the user who has uploaded.
				
				def getUploadedBy
					return @uploadedBy
				end

				# * Set the version description.
				# 
				# ==== Parameters
				# 
				# * description:: - Description for the version.
				
				def setDescription(description)
					@description = description
				end

				# * Get the version description.
				#
				# ==== Returns
				#   
				# * Version description.
				
				def getDescription
					return @description
				end

				# * Set the version.
				# 
				# ==== Parameters
				#  
				# * version:: - Version of the document.
				
				def setVersion(version)
					@version = version
				end

				# * Get the version.
				#
				# ==== Returns
				#   
				# * Document version.
				
				def getVersion
					return @version
				end

				# * Set when was the document uploaded on.
				# 
				# ==== Parameters
				# 
				# * uploadedOn:: - When was the document uploaded on.
				
				def setUploadedOn(uploadedOn)
					@uploadedOn = uploadedOn
				end

				# * Get when the document was uploaded on.
				#
				# ==== Returns
				#  
				# * Time of uploading the document.
				
				def getUploadedOn
					return @uploadedOn
				end

				# * Set the file size.
				# 
				# ==== Parameters
				#  
				# * fileSize:: - Size of the file.
				
				def setFileSize(fileSize)
					@fileSize = fileSize
				end

				# * Get the file size.
				#
				# ==== Returns
				#   
				# * File size.
				
				def getFileSize
					return @fileSize
				end

				# * Set the uploaded date.
				# 
				# ==== Parameters
				#  
				# * uploadedDate:: - Document uploaded date.
				
				def setUploadedDate(uploadedDate)
					@uploadedDate = uploadedDate
				end

				# * Get the uploaded date.
				#
				# ==== Returns
				#  
				# * Uploaded date.
				
				def getUploadedDate
					return @uploadedDate
				end

				# * Set the uploaded date format.
				# 
				# ==== Parameters
				#  
				# * uploadedDate:: - Document uploaded date format.
				
				def setUploadedDateFormat(uploadedDateFormat)
					@uploadedDateFormat = uploadedDateFormat
				end

				# * Get the uploaded date format.
				#
				# ==== Returns
				#   
				# * Uploaded date format.
				
				def getUploadedDateFormat
					return @uploadedDateFormat
				end

				# * Set the uploaded date long.
				# 
				# ==== Parameters
				#  
				# * uploadedDateLong:: - Document uploaded date long.
				
				def setUploadedDateLong(uploadedDateLong)
					@uploadedDateLong = uploadedDateLong
				end

				# * Get the document uploaded date long.
				#
				# ==== Returns
				#   
				# * document uploaded date long.
				
				def getUploadedDateLong
					return @uploadedDateLong
				end
		end
	end
end