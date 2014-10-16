#  $Id$ 
module Projects
	module Parser

		require 'json'
		require File.dirname(__FILE__).chomp("/projects/parser") + '/projects/model/Tasklist'

		# * Parse the JSON response into respective objects.

		class TasklistParser
			include Projects::Model

			# * Parse the JSON response and make it into List of Tasklist object.
			#
			# ==== Parameters
			#  
			# * response:: - This JSON response contains the details of task lists.
			#
			# ==== Returns
			#  
			# * List of TaskList object.

			def getTasklists(response)
				tasklists_all_json = JSON.parse response
				tasklists_all_array = tasklists_all_json["tasklists"]
				tasklists_class_array = Array.new
				for i in 0...tasklists_all_array.length
					tasklists_class_array.push(jsonToTasklist(tasklists_all_array[i]))
				end
				return tasklists_class_array
			end

			# * Parse the JSON response and make it into Tasklist object.
			#
			# ==== Parameters
			#  
			# * response:: - This JSON response contains the details of a task list.
			#
			# ==== Returns
			#   
			# * Tasklist object.

			def getTasklist(response)
				tasklists_json = JSON.parse response
				tasklists_array = tasklists_json["tasklists"]
				return jsonToTasklist(tasklists_array[0])
			end

			# * Parse the JSONObject into Tasklist object.
			#
			# ==== Parameters
			#   
			# * jsonObject:: - JSONObject contains the details of a task list.
			#
			# ==== Returns
			#  
			# * Tasklist object.

			def jsonToTasklist(jsonObject)
				tasklist = Tasklist.new
				
				if jsonObject.has_key?("id")
					tasklist.setId(jsonObject["id"])
				end
				if jsonObject.has_key?("name")
					tasklist.setName(jsonObject["name"])
				end
				if jsonObject.has_key?("completed")
					tasklist.setCompleted(jsonObject["completed"])
				end
				if jsonObject.has_key?("created_time")
					tasklist.setCreatedTime(jsonObject["created_time"])
				end
				if jsonObject.has_key?("created_time_format")
					tasklist.setCreatedTimeFormat(jsonObject["created_time_format"])
				end
				if jsonObject.has_key?("created_time_long")
					tasklist.setCreatedTimeLong(jsonObject["created_time_long"])
				end
				if jsonObject.has_key?("rolled")
					tasklist.setRolled(jsonObject["rolled"])
				end
				if jsonObject.has_key?("sequence")
					tasklist.setSequence(jsonObject["sequence"])
				end
				if jsonObject.has_key?("flag")
					tasklist.setFlag(jsonObject["flag"])
				end
				
				if jsonObject.has_key?("link")
					link = jsonObject["link"]
					
					if link.has_key?("self")
						tasklist.setURL(link["self"]["url"])
					end
					if link.has_key?("task")
						tasklist.setTaskURL(link["task"]["url"])
					end
				end
				

				if jsonObject.has_key?("milestone")
					milestoneParser = MilestonesParser.new
					milestone = jsonObject["milestone"]
					tasklist.setMilestone(milestoneParser.jsonToMilestone(milestone))
				end	
				return tasklist
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