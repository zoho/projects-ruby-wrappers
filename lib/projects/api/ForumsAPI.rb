#  $Id$ 
module Projects
	module Api

		require File.dirname(__FILE__).chomp("/projects/api") + '/projects/api/API'
		require File.dirname(__FILE__).chomp("/projects/api") + '/projects/util/ZohoHTTPClient'
		require File.dirname(__FILE__).chomp("/projects/api") + '/projects/parser/ForumParser'

		# * ForumsAPI is used to:
		# 
		# * Get list of forums.
		#	  
		# * Add a forum.
		#	  
		# * Update the details of a forum.
		#	  
		# * Delete an existing forum.
		#	  
		# * Get list of categories.
		#	 
		# * Add a category.
		#	  
		# * Get list of comments.
		#	 
		# * Add a comment.

		class ForumsAPI < API
			include Projects::Parser
			include Projects::Util
			# * ForumParser is used to parse the JSON response into respective objects.
			
			$forumParser = ForumParser.new

			# * Construct a new FoumsAPI using User's authToken and portalId.
			# 
			# ==== Parameters
			#
			# * authToken:: - User's authToken.
			#
			# * portalId:: - User's prtalId.

			def initialize(authToken,portalId)
				super(authToken,portalId)
			end	

			# * Get list of forum for the project.
			# 
			# ==== Parameters
			# * projectId:: - ID of the project.
			# 
			# * queryMap:: - This queryMap contains the filters in the form of key-value pair.
			# 
			# ==== Returns
			#
			# * List of Forum object.


			def getForums(projectId, queryMap)
				url = getBaseURL+"projects/"+String(projectId)+"/forums/"		
				response = ZohoHTTPClient.get(url, getQueryMap(queryMap))	
				return $forumParser.getForums(response)
			end
			
			# * Add a forum for the project.
			# 
			# ==== Parameters
			#
			# * projectId:: - ID of the project.
			# 
			# * forum:: - Forum object.
			# 
			# ==== Returns
			#
			# * Forum object.
			 

			def add(projectId, forum)
				url = getBaseURL+"projects/"+String(projectId)+"/forums/"		
				fileBody = Hash.new		
				fileBody["uploadfile"] = forum.getUploadfile		
				response = ZohoHTTPClient.post(url, getQueryMap, forum.toParamMAP, fileBody)	
				return $forumParser.getForum(response)
			end
			
			# * update the details of a forum.
			# 
			# ==== Parameters
			#
			# * projectId:: - ID of the project.
			#  
			# * forum:: - Forum object.
			# 
			# ==== Returns
			#
			# * Forum object.

			def update(projectId, forum)
				url = getBaseURL+"projects/"+String(projectId)+"/forums/"+String(forum.getId)+"/"
				fileBody = Hash.new 
				fileBody["uploadfile"] = forum.getUploadfile		
				response = ZohoHTTPClient.post(url, getQueryMap, forum.toParamMAP, fileBody)
				return $forumParser.getForum(response)
			end

			# * Delete an existing forum for the project.
			# 
			# ==== Parameters
			#
			# * projectId:: - ID of the project.
			# 
			# * forumId:: - ID of the forum.
			# 
			# ==== Returns
			#
			# * String object.
			
			def delete(projectId, forumId)
				url = getBaseURL+"projects/"+String(projectId)+"/forums/"+String(forumId)+"/"		
				response = ZohoHTTPClient.delete(url, getQueryMap)		
				return $forumParser.getResult(response)
			end
			
			# * Get list of categories for the project.
			# 
			# ==== Parameters
			#
			# * projectId:: - ID of the project.
			# 
			# ==== Returns
			#
			# * List of Category object.

			def getCategories(projectId)
				url = getBaseURL+"projects/"+String(projectId)+"/categories/"			
				response = ZohoHTTPClient.get(url, getQueryMap)
				return $forumParser.getCategories(response)
			end

			# * Add a category for the project.
			# 
			# ==== Parameters
			#
			# * projectId:: - ID of the project.
			# 
			# * category:: - Category object.
			# 
			# ==== Returns
			#
			# * Category object.

			def addCategory(projectId, category)
				url = getBaseURL+"projects/"+String(projectId)+"/categories/"		
				response = ZohoHTTPClient.post(url, getQueryMap, category.toParamMAP)		
				return $forumParser.getCategory(response)
			end

			# * Get list of Comment for the forum.
			# 
			# ==== Parameters
			#
			# * projectId:: - ID of the project.
			# 
			# * forumId:: - ID of the forum.
			# 
			# * queryMap:: - This queryMap contains the filters in the form of key-value pair.
			# 
			# ==== Returns
			#
			# * List of Comment object.
			
			def getComments(projectId, forumId, queryMap)
				url = getBaseURL+"projects/"+String(projectId)+"/forums/"+String(forumId)+"/comments/"		
				response = ZohoHTTPClient.get(url, getQueryMap(queryMap))		
				return $forumParser.getComments(response)
			end

			# * Add comment for the forum.
			# 
			# ==== Parameters
			#
			# * projectId:: - ID of the project.
			# 
			# * forumId:: - ID of the forum.
			# 
			# * comment:: - Comment object.
			# 
			# ==== Returns
			#
			# * Comment object.
			
			def addComment(projectId, forumId, comment)
				url = getBaseURL+"projects/"+String(projectId)+"/forums/"+String(forumId)+"/comments/"		
				response = ZohoHTTPClient.post(url, getQueryMap, comment.toParamMAP)		
				return $forumParser.getComment(response)
			end
		end
	end
end