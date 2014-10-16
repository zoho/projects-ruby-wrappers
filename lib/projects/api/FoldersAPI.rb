#  $Id$ 
module Projects
	module Api

		require File.dirname(__FILE__).chomp("/projects/api") + '/projects/api/API'
		require File.dirname(__FILE__).chomp("/projects/api") + '/projects/util/ZohoHTTPClient'
		require File.dirname(__FILE__).chomp("/projects/api") + '/projects/parser/FolderParser'


		# * FoldersAPI is used to:
		# 
		# * Get list of folder.
		#	 
		# * Add a folder.
		#	  
		# * Update the details of a folder.
		#	 
		# * Delete an existing folder.


		class FoldersAPI < API
			include Projects::Parser
			include Projects::Util
			# * FolderParser is used to parse the JSON response into respective objects.
			
			$folderParser = FolderParser.new

			# * Construct a new FoldersAPI using User's authToken and portalId.
			# 
			# ==== Parameters
			#
			# * authToken:: - User's authToken.
			# 
			# * portalId:: - User's portalId.

			def initialize(authToken,portalId)
				super(authToken,portalId)
			end

			# * Get list of folders for the project.
			# 
			# ==== Parameters
			#
			# * projectId:: - ID of the project.
			# 
			# ===== Returns
			#
			# * List of Folder object.
			
			def getFolders(projectId)
				url = getBaseURL+"projects/"+String(projectId)+"/folders/"		
				response = ZohoHTTPClient.get(url, getQueryMap)	
				return $folderParser.getFolders(response)
			end

			# * Add a folder for the project.
			# 
			# ==== Parameters
			#
			# * projectId:: - ID of the project.
			# 
			# * folder:: - Folder object.
			# 
			# ===== Returns
			#
			# * Folder object.
			
			def addFolder(projectId, folder)
				url = getBaseURL+"projects/"+String(projectId)+"/folders/"		
				response = ZohoHTTPClient.post(url, getQueryMap, folder.toParamMAP)		
				return $folderParser.getFolder(response)
			end

			# * Update the details of a folder.
			# 
			# ==== Parameters
			#
			# * projectId:: - ID of the project.
			# 
			# * folder:: - Folder object.
			# 
			# ===== Returns
			#
			# * Folder object.
			
			def updateFolder(projectId, folder)
				url = getBaseURL+"projects/"+String(projectId)+"/folders/"+String(folder.getId)+"/"		
				response = ZohoHTTPClient.post(url, getQueryMap, folder.toParamMAP)	
				return $folderParser.getFolder(response)
			end
			
			# * Delete an existing folder for the project.
			# 
			# ==== Parameters
			#
			# * projectId:: - ID of the project.
			# 
		 	# * folderId:: - ID of the folder.
		 	# 
		 	# ==== Returns
		 	#
			# * String object.

			def deleteFolder(projectId, folderId)
				url = getBaseURL+"projects/"+String(projectId)+"/folders/"+String(folderId)+"/"	
				response = ZohoHTTPClient.delete(url, getQueryMap)		
				return $folderParser.getResult(response)
			end
		end
	end
end