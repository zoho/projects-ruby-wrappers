#  $Id$ 
module Projects
	module Parser

		require 'json'
		require File.dirname(__FILE__).chomp("/projects/parser") + '/projects/model/Folder'

		# * Parse the JSON response into respective objects.

		class FolderParser 
			include Projects::Model
			# * Parse the JSON response and make it into List of Folder object.
			#
			# ==== Parameters
			#   
			# * response:: - This JSON response contains the details of folders.
			#
			# ==== Returns
			#  
			# * List of Folder object.
			
			def getFolders(response)
				folders_all_json = JSON.parse response
				folders_all_array = folders_all_json["folders"]
				folders_class_array = Array.new
				for i in 0...folders_all_array.length
					folders_class_array.push(jsonToFolder(folders_all_array[i]))
				end
				return folders_class_array
			end
			
			# * Parse the JSON response and make it into Folder object.
			#
			# ==== Parameters
			#   
			# * response:: - This JSON response contains the details of a folder.
			#
			# ==== Returns
			#  
			# * Folder object.

			def getFolder(response)
				folder_json = JSON.parse response
				folder_array = folder_json["folders"]
				return jsonToFolder(folder_array[0])
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