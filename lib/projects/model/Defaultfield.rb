# $Id$

module Projects

	module Model
	
		# * Defaultfield is used to make an object for projects default field.
	
		class Defaultfield
	
			private
		
		   attr_accessor :severityDetails, :statusDeatils, :moduleDetails, :priorityDetails, :classificationDetails;
		
		
			public 
		
				# * Set the severity details of the project.
				#
				# ==== Parameters
				#
				# * severityDetails:: - List of Severity details of the project.
			
				def setSeverityDetails(severityDetails)
			
					@severityDetails = severityDetails
				
				end
			
				# * Get the severity details of the project.
				#
				# ==== Returns
				#
				# * Returns list of severity details.
			
				def getSeverityDetails
			
					return @severityDetails
				
				end
			
				# * Set the stauts details of the project.
				#
				# ==== Prameters 
				#
				# * statusDeatils:: - List of Stauts details of the project.
			
				def setStatusDeatils(statusDeatils)
			
					@statusDeatils = statusDeatils
				
				end
			
				# * Get the status details of the project.
				#
				# ==== Returns
				#
				# * Returns list of status details.
			
				def getStatusDeatils
			
					return @statusDeatils
			
				end
			
				# * Set the module details of the project.
				#
				# ==== Parameters
				#
				# * moduleDetails:: - List of Module details of the project.
			
				def setModuleDetails(moduleDetails)
			
					@moduleDetails = moduleDetails
				
				end
			
				# * Get the module details of the project.
				#
				# ==== Returns
				#
				# * Returns list of module details.
			
				def getModuleDetails
			
					return @moduleDetails
				
				end
			
				# * Set the priority details of the project.
				#
				# ==== Parameters
				#
				# * priorityDetails:: - List of Priority details of the project.
			
				def setPriorityDetails(priorityDetails)
			
					@priorityDetails = priorityDetails
				
				end
			
				# * Get the priority details of the project.
				#
				# ==== Returns
				#
				# * Returns list of priority details.
			
				def getPriorityDetails
			
					return @priorityDetails
				
				end
			
				# * Set the classification details of the project.
				#
				# ==== Parameters
				#
				# * classificationDetails:: - List of Classification  details of the project.
			
				def setClassificationDetails(classificationDetails)
			
					@classificationDetails = classificationDetails
				
				end
			
				# * Get the classification details of the project.
				#
				# ==== Returns
				#
				# * Returns list of classification details.
			
				def getClassificationDetails
			
					return @classificationDetails
				
				end
			
		end
	end
end
	
