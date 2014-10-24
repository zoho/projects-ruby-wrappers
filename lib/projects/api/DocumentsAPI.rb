#  $Id$ 
module Projects
	module Api

		require File.dirname(__FILE__).chomp("/projects/api") + '/projects/api/API'
		require File.dirname(__FILE__).chomp("/projects/api") + '/projects/util/ZohoHTTPClient'
		require File.dirname(__FILE__).chomp("/projects/api") + '/projects/parser/DocumentParser'

		# * DocumentsAPI is used to:
		# 
		# * Get list of documents.
		#	 
		# * Get the details of a document.
		#	 
		# * Add a document.
		#	 
		# * Update the details of a document.
		#	 
		# * Delete an existing document.


		class DocumentsAPI < API
			include Projects::Parser
			include Projects::Util
			# * DocumentParser is used to parse the JSON response into respective objects.
			
			$documentParser = DocumentParser.new

			# * Construct a new DocumentsAPI using User's authToken and portalId.
			# 
			# ==== Parameters
			#
			# * authToken:: - User's authToken.
			# 
			# * portalId:: - User's portalId.


			def initialize(authToken,portalId)
				super(authToken,portalId)
			end


			# * Get list of documents for the project.
			# 
			# ==== Parameters
			# 
			# * projectId:: - ID of the project.
			# 
			# * queryMap:: - This queryMap contains the filters in the form of key-value pair.
			# 
			# ==== Returns
			#
			# * List of Document object.

			
			def getDocuments(projectId, queryMap)		
				url = getBaseURL+"projects/"+String(projectId)+"/documents/"		
				response = ZohoHTTPClient.get(url, getQueryMap(queryMap))		
				return $documentParser.getDocuments(response)
			end

			# * Get the details of a document.
			# 
			# ==== Parameters
			# 
			# * projectId:: - ID of the project.
			# 
			# * documentId:: - ID of the document.
			# 
			# * queryMap:: - This queryMap contains the filters in the form of key-value pair.
			# 
			# ==== Returns
			#
			# * Document object.

			
			def get(projectId, documentId, queryMap)
				url = getBaseURL+"projects/"+String(projectId)+"/documents/"+String(documentId)+"/"
				response = ZohoHTTPClient.get(url, getQueryMap(queryMap))		
				return $documentParser.getDocument(response)
			end

			# * Add a document for the project.
			#
			# ==== Parameters
			#  
			# * projectId:: - Id of the project.
			# 
		 	# * document:: - Document object.
		 	# 
		 	# ==== Returns
		 	#
			# * Document object.
			
			def add(projectId, document)
				url = getBaseURL+"projects/"+String(projectId)+"/documents/"
				fileBody = Hash.new
				fileBody["uploaddoc"] = document.getUploaddoc
				response = ZohoHTTPClient.post(url, getQueryMap, document.toParamMAP, fileBody)		
				return $documentParser.getDocument(response)
			end

			# * Update the details of a document.
			# 
			# ==== Attributes
			# 
			# * projectId:: - ID of the project.
			# 
			# * document:: - Document object.
			# 
			# ==== Returns
			#
			# * Document object.

			
			def update(projectId, document)
				url = getBaseURL+"projects/"+String(projectId)+"/documents/"+String(document.getId)+"/"
				fileBody = Hash.new 
				fileBody["uploaddoc"] = document.getUploaddoc
				response = ZohoHTTPClient.post(url, getQueryMap, document.toParamMAP, fileBody)		
				return $documentParser.getDocument(response)
			end


			# * Delete an existing document for the project.
			# 
			# ==== Attributes
			# 
		 	# * projectId:: - ID of the project.
		 	# 
			# * documentId:: - ID of the document.
			# 
			# ==== Returns
			#
			# * return Returns the String object.

			
			def delete(projectId, documentId)
				url = getBaseURL+"projects/"+String(projectId)+"/documents/"+String(documentId)+"/"
				response = Projects::Util::ZohoHTTPClient.delete(url, getQueryMap)		
				return $documentParser.getResult(response)
			end
		end
	end
end
