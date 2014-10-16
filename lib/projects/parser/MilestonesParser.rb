#  $Id$ 
module Projects
	module Parser

		require 'json'
		require File.dirname(__FILE__).chomp("/projects/parser") + '/projects/model/Milestone'

		# * Parse the JSON response into respective objects.

		class MilestonesParser
			include Projects::Model
			# * Parse the JSON response and make it into List of Milestone object.
			#
			# ==== Parameters
			# 
			# * response:: - This JSON response contains the details of milestones.
			#
			# ==== Returns
			#  
			# * List of Milestone object.

			def getMilestones(response)
				milestones_all_json = JSON.parse response
				milestones_all_array = milestones_all_json["milestones"]
				milestones_class_array = Array.new
				for i in 0...milestones_all_array.length
					milestones_class_array.push(jsonToMilestone(milestones_all_array[i]))
				end
				return milestones_class_array
			end
			
			# * Parse the JSON response and make it into Milestone object.
			#
			# ==== Parameters
			#  
			# * response:: - This JSON response contains the details of a milestone.
			#
			# ==== Returns
			#  
			# * Milestone object.

			def getMilestone(response)
				milestones_json = JSON.parse response
				milestones_array = milestones_json["milestones"]
				return jsonToMilestone(milestones_array[0])
			end

			# * Parse the JSONObject into Milestone object.
			#
			# ==== Parameters
			#  
			# * jsonObject:: - JSONObject contains the details of a milestone.
			#
			# ==== Returns
			#   
			# * Milestone object.

			def jsonToMilestone(jsonObject)
				milestone = Milestone.new
				
				if jsonObject.has_key?("id")
					milestone.setId(jsonObject["id"])
				end
				if jsonObject.has_key?("name")
					milestone.setName(jsonObject["name"])
				end
				if jsonObject.has_key?("start_date")
					milestone.setStartDate(jsonObject["start_date"])
				end
				if jsonObject.has_key?("start_date_format")
					milestone.setStartDateFormat(jsonObject["start_date_format"])
				end
				if jsonObject.has_key?("start_date_long")
					milestone.setStartDateLong(jsonObject["start_date_long"])
				end
				if jsonObject.has_key?("end_date")
					milestone.setEndDate(jsonObject["end_date"])
				end
				if jsonObject.has_key?("end_date_format")
					milestone.setEndDateFormat(jsonObject["end_date_format"])
				end
				if jsonObject.has_key?("end_date_long")
					milestone.setEndDateLong(jsonObject["end_date_long"])
				end
				if jsonObject.has_key?("status")
					milestone.setStatus(jsonObject["status"])
				end
				if jsonObject.has_key?("flag")
					milestone.setFlag(jsonObject["flag"])
				end
				if jsonObject.has_key?("owner_id")
					milestone.setOwnerId(jsonObject["owner_id"])
				end
				if jsonObject.has_key?("owner_name")
					milestone.setOwnerName(jsonObject["owner_name"])
				end
				
				if jsonObject.has_key?("link")
					link = jsonObject["link"]

					if link.has_key?("self")
						milestone.setURL(link["self"]["url"])
					end
					if link.has_key?("status")
						milestone.setStatusURL(link["status"]["url"])
					end
				end
				
				return milestone
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