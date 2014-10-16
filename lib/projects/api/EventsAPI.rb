#  $Id$ 
module Projects
	module Api

		require File.dirname(__FILE__).chomp("/projects/api") + '/projects/api/API'
		require File.dirname(__FILE__).chomp("/projects/api") + '/projects/util/ZohoHTTPClient'
		require File.dirname(__FILE__).chomp("/projects/api") + '/projects/parser/EventParser'


		# * EventsAPI is used to:
		# 
		# * Get list of events.
		#	 
		# * Add an event.
		#	 
		# * Update the details of an event.
		#	 
		# * Delete an existing event.
		 

		class EventsAPI < API	
			include Projects::Parser
			include Projects::Util	
			# * EventParser is used to parse the JSON response into respective objects.

			$eventParser = EventParser.new

			# * Construct a new EventsAPI using User's authToken and portalId.
			# 
			# ==== Parameters
			#
			# * authToken:: - User's authToken.
			# 
			# * portalId:: - User's portalId.

			def initialize(authToken,portalId)
				super(authToken,portalId)
			end
			
			# * Get list of events for the project.
			# 
			# ==== Parameters
			#
			# * projectId:: - ID of the project.
			# 
			# * queryMap:: - This queryMap contains the filters in the form of key-value pair.
			# 
			# ==== Returns
			#
			# * List of Event object.


			def getEvents(projectId, queryMap)
				url = getBaseURL+"projects/"+String(projectId)+"/events/"		
				response = ZohoHTTPClient.get(url, getQueryMap(queryMap))	
				return $eventParser.getEvents(response)
			end
			
			# * Add an event for the project.
			#
			# ==== Parameters
			# 
			# * projectId:: - ID of the project.
			# 
			# * event:: - Event object.
			# 
			# ==== Returns
			#
			# * Event object.


			def add(projectId, event)
				url = getBaseURL+"projects/"+String(projectId)+"/events/"		
				response = ZohoHTTPClient.post(url, getQueryMap, event.toParamMAP)		
				return $eventParser.getEvent(response)
			end
			
			# * Update the details of an event.
			# 
			# ==== Parameters
			#
			# * projectId:: - ID of the project.
			# 
			# * event:: - Event object.
			# 
			# ==== Returns
			#
			# * Event object.

			def update(projectId, event)
				url = getBaseURL+"projects/"+String(projectId)+"/events/"+String(event.getId)+"/"		
				response = ZohoHTTPClient.post(url, getQueryMap, event.toParamMAP)		
				return $eventParser.getEvent(response)
			end
			
			# * Delete an existing event for the project.
			# 
			# ==== Parameters
			#
			# * projectId:: - ID of the project.
			# 
			# * eventId:: - ID of the event.
			# 
			# ==== Returns
			#
			# * String object.

			def delete(projectId, eventId)
				url = getBaseURL+"projects/"+String(projectId)+"/events/"+String(eventId)+"/"		
				response = ZohoHTTPClient.delete(url, getQueryMap)
				return $eventParser.getResult(response)
			end
		end
	end
end