#  $Id$ 
module Projects
	module Model
		# * This class is used to make an object for Participant.

		class Participant 

			private
				attr_accessor :participantId, :participantPerson

			public
			
				# * Set the participant id.
				# 
				# ==== Parameters
				#  
				# * participantId:: - ID of the participant.

				def setParticipantId(participantId)
					@participantId = participantId
				end

				# * Get the participant id.
				#
				# ==== Returns
				#  
				# * Participant id.
				
				def getParticipantId
					return @participantId
				end

				# * Set the participant name.
				# 
				# ==== Parameters
				#  
				# * participantPerson:: - Name of the participant.
				
				def setParticipantPerson(participantPerson)
					@participantPerson = participantPerson
				end

				# * Get the participant name.
				#
				# ==== Returns
				#  
				# * Participant name.
				
				def getParticipantPerson
					return @participantPerson
				end
		end
	end
end