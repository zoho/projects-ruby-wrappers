#  $Id$ 
module Projects
	module Parser

		require 'json'
		require File.dirname(__FILE__).chomp("/projects/parser") + '/projects/model/Bug'


		# * Parse the JSON response into respective objects.

		class BugParser 
			include Projects::Model
			# * Parse the JSON response and make it into List of Bug object.
			#
			# ==== Parameters
			#   
			# * response:: - This JSON response contains the details of bugs.
			#
			# ==== Returns
			# 
			# * List of Bug object.
 

			def getBugs(response)
				bugs_all_json = JSON.parse response
				bugs_all_array = bugs_all_json["bugs"]
				bugs_class_array = Array.new
				for i in 0...bugs_all_array.length
					bugs_class_array.push(jsonToBug(bugs_all_array[i]))
				end
				return bugs_class_array
			end

			# * Parse the JSON response and make it into Bug object.
			#
			# ==== Parameters
			#   
			# * response:: - This JSON response contains the details of a bug.
			#
			# ==== Returns
			#  
			# * Bug object.
 

			
			def getBug(response)
				bug_json = JSON.parse response
				bug_array = bug_json["bugs"]
				return jsonToBug(bug_array[0])
			end
			
			# * Parse the JSONObject into Bug object.
			#
			# ==== Parameters
			#   
			# * jsonObject:: - JSONObject contains the details of a bug.
			#
			# ==== Returns
			#  
			# * Bug object.
 

			def jsonToBug(jsonObject)
				bug = Bug.new
				
				if jsonObject.has_key?("id")
					bug.setId(jsonObject["id"])
				end
				if jsonObject.has_key?("key")
					bug.setKey(jsonObject["key"])
				end
				
				if jsonObject.has_key?("project")
					bug.setProjectId(jsonObject["project"]["id"])
				end
				
				if jsonObject.has_key?("flag")
					bug.setFlag(jsonObject["flag"])
				end
				if jsonObject.has_key?("title")
					bug.setTitle(jsonObject["title"])
				end
				if jsonObject.has_key?("description")
					bug.setDescription(jsonObject["description"])
				end
				if jsonObject.has_key?("reporter_id")
					bug.setReporterId(jsonObject["reporter_id"])
				end
				if jsonObject.has_key?("reported_person")
					bug.setReportedPerson(jsonObject["reported_person"])
				end
				if jsonObject.has_key?("created_time")
					bug.setCreatedTime(jsonObject["created_time"])
				end
				if jsonObject.has_key?("created_time_format")
					bug.setCreatedTimeFormat(jsonObject["created_time_format"])
				end
				if jsonObject.has_key?("created_time_long")
					bug.setCreatedTimeLong(jsonObject["created_time_long"])
				end
				if jsonObject.has_key?("assignee_id")
					bug.setAssigneeId(jsonObject["assignee_id"])
				end
				if jsonObject.has_key?("assignee_name")
					bug.setAssigneeName(jsonObject["assignee_name"])
				end
				if jsonObject.has_key?("closed")	
					bug.setClosed(jsonObject["closed"])
				end
				if jsonObject.has_key?("due_date")
					bug.setDueDate(jsonObject["due_date"])
				end
				if jsonObject.has_key?("due_date_format")
					bug.setDueDateFormat(jsonObject["due_date_format"])
				end
				if jsonObject.has_key?("due_date_long")
					bug.setDueDateLong(jsonObject["due_date_long"])
				end
				
				
				if jsonObject.has_key?("classification")
					classification = jsonObject["classification"]
					
					if classification.has_key?("id")
						bug.setClassificationId(classification["id"])
					end
					if classification.has_key?("type")
						bug.setClassificationType(classification["type"])
					end
				end
				
				if jsonObject.has_key?("severity")
					severity = jsonObject["severity"]
					
					if severity.has_key?("id")
						bug.setSeverityId(severity["id"])
					end
					if severity.has_key?("type")
						bug.setSeverityType(severity["type"])
					end
				end
				
				if jsonObject.has_key?("status")
					status = jsonObject["status"]
					
					if status.has_key?("id")
						bug.setStatusId(status["id"])
					end
					if status.has_key?("type")
						bug.setStatusType(status["type"])
					end
				end
				
				if jsonObject.has_key?("reproducible")
					reproducible = jsonObject["reproducible"]
					
					if reproducible.has_key?("id")
						bug.setReproducibleId(reproducible["id"])
					end
					if reproducible.has_key?("type")
						bug.setReproducibleType(reproducible["type"])
					end
				end
				
				if jsonObject.has_key?("module")
					mod = jsonObject["module"]
					
					if mod.has_key?("id")
						bug.setModuleId(mod["id"])
					end
					if mod.has_key?("name")
						bug.setModuleName(mod["name"])
					end
				end
				
				if jsonObject.has_key?("link")
					link = jsonObject["link"]
					
					if link.has_key?("self")
						bug.setURL(link["self"]["url"])
					end
					
					if link.has_key?("timesheet")
						bug.setTimesheetURL(link["timesheet"]["url"])
					end
				end
				
				return bug
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