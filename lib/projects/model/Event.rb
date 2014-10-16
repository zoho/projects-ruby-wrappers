#  $Id$ 
module Projects
	module Model
		# * This class is used to make an object for Event.

		class Event

			private
				attr_accessor :id, :title, :location, :scheduledOn, :scheduledOnLong, :reminder, :repeat, :occurrences, :occurred, :durationHour, :durationMinutes, :isOpen, :participants, :hour, :minutes, :ampm
			
			public
			
				# * Set the event id.
				# 
				# ==== Parameters
				# 
				# * id:: - ID of the event.

				def setId(id)
					@id = id
				end

				# * Get the event id.
				#
				# ==== Returns
				#  
				# * Event id.
				
				def getId
					return @id
				end

				# * Set the event title.
				# 
				# ==== Parameters
				#  
				# * title:: - Title of the event.
				
				def setTitle(title)
					@title = title
				end

				# * Get the event title.
				#
				# ==== Returns
				#   
				# * Event title.
				
				def getTilte
					return @title
				end

				# * Set the event location.
				# 
				# ==== Parameters
				#  
				# * location:: - Location of the event.
				
				def setLocation(location)
					@location = location
				end

				# * Get the event location.
				#
				# ==== Returns
				#   
				# * Event location.
				
				def getLocation
					return @location
				end

				# * Set the event scheduled on.
				# 
				# ==== Parameters
				#  
				# * scheduledOn:: - Scheduled time of the event.
				
				def setScheduledOn(scheduledOn)
					@scheduledOn = scheduledOn
				end

				# * Get the event scheduled on.
				#
				# ==== Returns
				#  
				# * Event scheduled time.
				
				def getScheduledOn
					return @scheduledOn
				end

				# * Set the event scheduled on long.
				# 
				# ==== Parameters
				#  
				# * scheduledOnLong:: - Event scheduled on long.
				
				def setScheduledOnLong(scheduledOnLong)
					@scheduledOnLong = scheduledOnLong
				end

				# * Get the event scheduled on long.
				#
				# ==== Returns
				#   
				# * Event scheduled on long.
				
				def getScheduledOnLong
					return @scheduledOnLong
				end

				# * Set the reminder for the event.
				# 
				# ==== Parameters
				#  
				# * reminder:: - Reminder for the event.
			
				def setReminder(reminder)
					@reminder = reminder
				end

				# * Get the reminder for the event.
				#
				# ==== Returns
				#   
				# * event reminder.
			
				def getReminder
					return @reminder
				end

				# * Set the reminder repeat for the event.
				# 
				# ==== Parameters
				#  
				# * repeat:: - Repeat reminder for the event.
				
				def setRepeat(repeat)
					@repeat = repeat
				end

				# * Get the reminder repeat for the event.
				#
				# ==== Returns
				#   
				# * event reminder repeat.
			
				def getRepeat
					return @repeat
				end

				# * Set the occurrences for the reminder. 
				# 
				# ==== Parameters
				#  
				# * occurrences:: - Numnber of occurrences for the reminder.
			
				def setOccurrences(occurrences)
					@occurrences = occurrences
				end

				# * Get the occurrences for the reminder.
				#
				# ==== Returns
				#  
				# * Number of occurences of the reminder.
					
				def getOccurrences
					return @occurrences
				end

				# * Set no of times occurred for the reminder.
				# 
				# ==== Parameters
				# 
				# * occurred:: - Number of times reminder has occurred.	

				def setOccurred(occurred)
					@occurred = occurred
				end

				# * Get no of times occurred for the reminder.
				#
				# ==== Returns
				#   
				# * No of times the reminder has occurred.
				
				def getOccurred
					return @occurred
				end

				# * Set the duration hour.
				# 
				# ==== Parameters
				#  
				# * durationHour:: - Duration of the event in hours.
				
				def setDurationHours(durationHour)
					@durationHour = durationHour
				end

				# * Get the duration hour for the event.
				#
				# ==== Returns
				#   
				# * Event duration in hours.
				
				def getDurationHours
					return @durationHour
				end

				# * Set the duration minutes for the event.
				# 
				# ==== Parameters
				#  
				# * durationMinutes:: - Duration of the event in minutes.
				
				def setDurationMinutes(durationMinutes) 
					@durationMinutes = durationMinutes
				end

				# * Get the duration minutes for the event.
				#
				# ==== Returns
				#   
				# * Event duration in minutes.
					
				def getDurationMinutes
					return @durationMinutes
				end

				# * Set the event is open or not.
				# 
				# ==== Parameters
				# 
				# * isOpen:: - The event is open or not.

				def setIsOpen(isOpen)
					@isOpen = isOpen
				end

				# * Get the event is open or not.
				#
				# ==== Returns
				#   
				# * true, if the event is open else false.	

				def isOpen
					return @isOpen
				end

				# * Set the participants.
				# 
				# ==== Parameters
				#  
				# * participants:: - List of Participant object.

				def setParticipants(participants)
					@participants = participants
				end

				# * Get the participants.
				#
				# ==== Returns
				#   
				# * List of Participant object.
						
				def getParticipants
					return @participants
				end

				# * Set the hour for the event.
				# 
				# ==== Parameters
				# 
				# * hour:: - Hour for the event.
				
				def setHour(hour)
					@hour = hour
				end

				# * Get the hour for the event.
				#
				# ==== Returns
				#   
				# * Event hour.
				
				def getHour
					return @hour
				end

				# * Set the minutes for the event.
				# 
				# ==== Parameters
				#  
				# * minutes:: - Minutes for the event.
				
				def setMinutes(minutes)
					@minutes = minutes
				end

				# * Get the minutes for the event.
				#
				# ==== Returns
				#  
				# * Minutes for the event.
				
				def getMinutes
					return @minutes
				end

				# * Set AM or PM for the event.
				# 
				# ==== Parameters
				#  
				# * ampm:: - Event scheduled on AM or PM.
				
				def setAMPM(ampm)
					@ampm = ampm
				end

				# * Get AM or PM for the event.
				#
				# ==== Returns
				#   
				# * Time format of the event in AM or PM.
				
				def getAMPM
					return @ampm
				end
			
				# * Convert the Event object into HashMap.
				#
				# ==== Returns
				#  
				# * HashMap object.

				def toParamMAP
					requestBody = Hash.new
					
					if title != nil
						requestBody["title"] = title
					end
					if scheduledOn != nil
						requestBody["date"] = scheduledOn
					end
					if hour != nil
						requestBody["hour"] = hour
					end
					if minutes != nil
						requestBody["minutes"] = minutes
					end
					if ampm != nil
						requestBody["ampm"] = ampm
					end
					if durationHour != nil
						requestBody["duration_hour"] = durationHour
					end
					if durationMinutes != nil
						requestBody["duration_mins"] = durationMinutes
					end

					if participants != nil
						participantIds = ""

						participants.each do|participant|
							participantIds += String(participant.getParticipantId)+",";
						end				
						
						requestBody["participants"] = participantIds
					end

					if reminder != nil
						requestBody["remind_before"] = reminder
					end
					if repeat != nil
						requestBody["repeat"] = repeat
					end
					if occurrences != nil && occurrences.to_i > 1
						requestBody["nooftimes_repeat"] = occurrences
					end
					if location != nil
						requestBody["location"] = location
					end			
					
					return requestBody
				end
		end
	end
end