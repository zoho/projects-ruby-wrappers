#  $Id$ 
module Projects
	module Parser
			
		require 'json'
		require File.dirname(__FILE__).chomp("/projects/parser") + '/projects/model/Document'
		require File.dirname(__FILE__).chomp("/projects/parser") + '/projects/model/Version'
		require File.dirname(__FILE__).chomp("/projects/parser") + '/projects/model/Folder'

		# * Parse the JSON response into respective objects.

		class DocumentParser
			include Projects::Model	
			# * Parse the JSON response and make it into List of Document object.
			#
			# ==== Parameters
			#  
			# * response:: - This JSON response contains the details of a documents.
			#
			# ==== Returns
			#   
			# * List of Document object.

			def getDocuments(response)
				documents_all_json = JSON.parse response
				documents_all_array = documents_all_json["documents"]
				documents_class_array = Array.new
				for i in 0...documents_all_array.length
					documents_class_array.push(jsonToDocument(documents_all_array[i]))
				end
				return documents_class_array
			end
			
			# * Parse the JSON response and make it into Document object.
			#
			# ==== Parameters
			#  
			# * response:: - This JSON response contains the details of a document.
			#
			# ==== Returns
			#   
			# * Document object.

			def getDocument(response)
				document_json = JSON.parse response
				document_array = document_json["documents"]
				return jsonToDocument(document_array[0])
			end

			# * Parse the JSONObject into Document object.
			#
			# ==== Parameters
			#   
			# * jsonObject:: - JSONObject contains the details of the document.
			#
			# ==== Returns
			#   
			# * Document object.
			
			def jsonToDocument(jsonObject)
				document = Document.new
				
				if jsonObject.has_key?("id")
					document.setId(jsonObject["id"])
				end
				if jsonObject.has_key?("file_name")
					document.setFilename(jsonObject["file_name"])
				end
				if jsonObject.has_key?("content_type")
					document.setContenttype(jsonObject["content_type"])
				end
				
				if jsonObject.has_key?("versions")
					versions = jsonObject["versions"]
					
					versionList = Array.new
		 			
					for i in 0...versions.length
						version = versions[i]
						versionList.push(jsonToVersion(version))
					end
					
					document.setVersions(versionList)
				end
				
				if jsonObject.has_key?("folder")
					folder = jsonObject["folder"]		
					document.setFolder(jsonToFolder(folder))
				end
				
				if jsonObject.has_key?("link")
					link = jsonObject["link"]
					
					if link.has_key?("self")
						document.setURL(link["self"]["url"])
					end
				end
				
				return document
			end
			
			# * Parse the JSONObject into Version object.
			#
			# ==== Parameters
			#  
			# * jsonObject:: - JSONObject contains the details of a version.
			#
			# ==== Returns
			#   
			# * Version object.

			def jsonToVersion(jsonObject)
				version = Version.new
				
				if jsonObject.has_key?("id")
					version.setId(jsonObject["id"])
				end
				if jsonObject.has_key?("uploaded_by")
					version.setUploadedBy(jsonObject["uploaded_by"])
				end
				if jsonObject.has_key?("description")
					version.setDescription(jsonObject["description"])
				end
				if jsonObject.has_key?("version")
					version.setVersion(jsonObject["version"])
				end
				if jsonObject.has_key?("uploaded_on")
					version.setUploadedOn(jsonObject["uploaded_on"])
				end
				if jsonObject.has_key?("file_size")
					version.setFileSize(jsonObject["file_size"])
				end
				if jsonObject.has_key?("uploaded_date")
					version.setUploadedDate(jsonObject["uploaded_date"])
				end
				if jsonObject.has_key?("uploaded_date_format")
					version.setUploadedDateFormat(jsonObject["uploaded_date_format"])
				end
				if jsonObject.has_key?("uploaded_date_long")
					version.setUploadedDateLong(jsonObject["uploaded_date_long"])
				end
				
				return version
			end
			
			# * Parse the JSONObject into Folder object.
			#
			# ==== Parameters
			#  
			# * jsonObject:: - JSONObject contains the details of a folder.
			#
			# ==== Returns
			#  
			# * Folder object.

			def jsonToFolder(jsonObject)
				folder = Folder.new
				
				if jsonObject.has_key?("id")
					folder.setId(jsonObject["id"])
				end
				if jsonObject.has_key?("name")
					folder.setName(jsonObject["name"])
				end
				if jsonObject.has_key?("is_discussion")
					folder.setIsDicussion(jsonObject["is_discussion"])
				end
				
				if jsonObject.has_key?("link")
					link = jsonObject["link"]
					
					if link.has_key?("self")
						folder.setURL(link["self"]["url"])
					end
				end
				
				return folder
			end

			# * Parse the JSON response and get the success message.
			#
			# ==== Parameters
			#  
			# * response:: - This JSON response contains the success message.
			#
			# ==== Returns
			#   
			# * String object.

			def getResult(response)
				jsonObject = JSON.parse response
				result = jsonObject["response"]
				return result
			end
		end
	end
end