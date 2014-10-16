#  $Id$ 
module Projects
	module Parser

		require 'json'
		require File.dirname(__FILE__).chomp("/projects/parser") + '/projects/model/Event'
		require File.dirname(__FILE__).chomp("/projects/parser") + '/projects/model/Participant'


		# * Parse the JSON response into respective objects.

		class EventParser	
			include Projects::Model
			# * Parse the JSON response and make it into List of Event object.
			#
			# ==== Parameters
			#   
			# * response:: - This JSON response contains the details of events.
			#
			# ==== Returns
			#  
			# * List of Event object.
			
			def getEvents(response)
				events_all_json = JSON.parse response
				events_all_array = events_all_json["events"]
				events_class_array = Array.new
				for i in 0...events_all_array.length
					events_class_array.push(jsonToEvent(events_all_array[i]))
				end
				return events_class_array
			end

			# * Parse the JSON response and make it into Event object.
			#
			# ==== Parameters
			#   
			# * response:: - This JSON response contains the details of an event.
			#
			# ==== Returns
			#   
			# * Event object.
			
			def getEvent(response)
				event_json = JSON.parse response
				event_array = event_json["events"]
				return jsonToEvent(event_array[0])
			end

			# * Parse the JSONObject into Event object.
			#
			# ==== Parameters
			#  
			# * jsonObject:: - JSONObject contains the details of an event.
			#
			# ==== Returns
			#   
			# * Event object.
			
			def jsonToEvent(jsonObject)
				
				event = Event.new

				if jsonObject.has_key?("id")
					event.setId(jsonObject["id"])
				end
				if jsonObject.has_key?("title")
					event.setTitle(jsonObject["title"])
				end
				if jsonObject.has_key?("location")
					event.setLocation(jsonObject["location"])
				end
				if jsonObject.has_key?("scheduled_on")
					event.setScheduledOn(jsonObject["scheduled_on"])
				end
				if jsonObject.has_key?("scheduled_on_long")
					event.setScheduledOnLong(jsonObject["scheduled_on_long"])
				end
				if jsonObject.has_key?("reminder")
					event.setReminder(jsonObject["reminder"])
				end
				if jsonObject.has_key?("repeat")
					event.setRepeat(jsonObject["repeat"])
				end
				if jsonObject.has_key?("occurrence(s)")
					event.setOccurrences(jsonObject["occurrence(s)"])
				end
				if jsonObject.has_key?("occurred")
					event.setOccurred(jsonObject["occurred"])
				end
				if jsonObject.has_key?("duration_hour")
					event.setDurationHours(jsonObject["duration_hour"])
				end
				if jsonObject.has_key?("duration_minutes")
					event.setDurationMinutes(jsonObject["duration_minutes"])
				end
				
				if jsonObject.has_key?("participants")
					participants = jsonObject["participants"]
				
					participantList = Array.new

					for j in 0...participants.length
						participant = participants[j]
						participantList.push(jsonToParticipant(participant))
					end
					
					event.setParticipants(participantList)
				end
				
				return event
			end

			# * Parse the JSONObject into Participant object.
			#
			# ==== Parameters
			#   
			# * jsonObject:: - JSONObject contains the details of a participant.
			#
			# ==== Returns
			#   
			# * Participant object.	
			
			def jsonToParticipant(jsonObject)
				
				participant = Participant.new
				
				if jsonObject.has_key?("participant_id")
					participant.setParticipantId(jsonObject["participant_id"])
				end
				if jsonObject.has_key?("participant_person")
					participant.setParticipantPerson(jsonObject["participant_person"])
				end
				
				return participant
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