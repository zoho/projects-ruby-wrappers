#  $Id$ 
module Projects
	module Parser

		require 'json'
		require File.dirname(__FILE__).chomp("/projects/parser") + '/projects/model/Project'
		require File.dirname(__FILE__).chomp("/projects/parser") + '/projects/model/Activity'
		require File.dirname(__FILE__).chomp("/projects/parser") + '/projects/model/Status'

		# * Parse the JSON response into respective objects.

		class ProjectParser
			include Projects::Model
			# * Parse the JSON response and make it into List of Project object.
			#
			# ==== Parameters
			#  
			# * response:: - This JSON response contains the details of Projects.
			#
			# ==== Returns
			#   
			# * List of Project object.

			def getProjects(response)
				projects_all_json = JSON.parse response
				projects_all_array = projects_all_json["projects"]
				projects_class_array = Array.new
				for i in 0...projects_all_array.length
					projects_class_array.push(jsonToProject(projects_all_array[i]))
				end
				return projects_class_array
			end 

			# * Parse the JSON response and make it into Project object.
			#
			# ==== Parameters
			#  
			# * response:: - This JSON response contains the details of a Project.
			#
			# ==== Returns
			#  
			# * Project object.

			def getProject(project)
				project_json = JSON.parse project
				project_array = project_json["projects"]
				return jsonToProject(project_array[0])
			end

			# * Parse the JSONObject into Project object.
			#
			# ==== Parameters
			#   
			# * jsonObject:: - JSONObject contains the details of a project.
			#
			# ==== Returns
			#   
			# * Project object.

			def jsonToProject(jsonObject)
				project = Project.new	
				
				if jsonObject.has_key?("id")
					project.setId(jsonObject["id"])
				end
				if jsonObject.has_key?("name")
					project.setName(jsonObject["name"])
				end
				if jsonObject.has_key?("status")
					project.setStatus(jsonObject["status"])
				end
				if jsonObject.has_key?("created_date")
					project.setCreatedDate(jsonObject["created_date"])
				end
				if jsonObject.has_key?("created_date_format")
					project.setCreatedDateFormat(jsonObject["created_date_format"])
				end
				if jsonObject.has_key?("created_date_long")
					project.setCreatedDateLong(jsonObject["created_date_long"])
				end
				if jsonObject.has_key?("description")
					project.setDescription(jsonObject["description"])
				end
				if jsonObject.has_key?("owner_name")
					project.setOwnerName(jsonObject["owner_name"])
				end
				if jsonObject.has_key?("owner_id")
					project.setOwnerId(jsonObject["owner_id"])
				end
				
				if jsonObject.has_key?("task_count")
					taskCount = jsonObject["task_count"]
					if taskCount.has_key?("open")
						project.setOpenTaskCount(taskCount["open"])
					end
					if taskCount.has_key?("closed")
						project.setClosedTaskCount(taskCount["closed"])
					end
				end
				
				if jsonObject.has_key?("milestone_count")
					milestoneCount = jsonObject["milestone_count"]
					if milestoneCount.has_key?("open")
						project.setOpenMilestoneCount(milestoneCount["open"])
					end
					if milestoneCount.has_key?("closed")
						project.setClosedMilestoneCount(milestoneCount["closed"])
					end
				end

				if jsonObject.has_key?("bug_count")
					bugCount = jsonObject["bug_count"]
					if bugCount.has_key?("open")
						project.setOpenBugCount(bugCount["open"])
					end
					if bugCount.has_key?("closed")
						project.setClosedBugCount(bugCount["closed"])
					end
				end
				
				if jsonObject.has_key?("link")
					link = jsonObject["link"]
					
					if link.has_key?("self")
						project.setURL(link["self"]["url"])
					end
					if link.has_key?("activity")
						project.setActivityURL(link["activity"]["url"])
					end
					if link.has_key?("milestone")
						project.setMilestoneURL(link["milestone"]["url"])
					end
					if link.has_key?("tasklist")
						project.setTasklistURL(link["tasklist"]["url"])
					end
					if link.has_key?("task")
						project.setTaskURL(link["task"]["url"])
					end
					if link.has_key?("bug")
						project.setBugURL(link["bug"]["url"])
					end
					if link.has_key?("timesheet")
						project.setTimesheetURL(link["timesheet"]["url"])
					end
					if link.has_key?("status")
						project.setStatusURL(link["status"]["url"])
					end
					if link.has_key?("event")
						project.setEventURL(link["event"]["url"])
					end
					if link.has_key?("document")
						project.setDocumentURL(link["document"]["url"])
					end
					if link.has_key?("folder")
						project.setFolderURL(link["folder"]["url"])
					end
					if link.has_key?("forum")
						project.setForumURL(link["forum"]["url"])
					end
					if link.has_key?("user")
						project.setUserURL(link["user"]["url"])
					end
				end
				
				return project
			end

			# * Parse the JSON response and make it into List of Activity object.
			#
			# ==== Parameters
			# 
			# * response:: - This JSON response contains the details of a activities.
			#
			# ==== Returns
			#  
			# * List of Activity object.

			def getActivities(response)
				activities_all_json = JSON.parse response
				activities_all_array = activities_all_json["activities"]
				activity_class_array = Array.new
				for i in 0...activities_all_array.length
					activity_class_array.push(jsonToActivity(activities_all_array[i]))
				end
				return activity_class_array
			end

			# * Parse the JSONObject into Activity object.
			#
			# ==== Parameters
			#  
			# * jsonObject:: - JSONObject contains the details of a activity.
			#
			# ==== Returns
			#  
			# * Activity object.	
			
			def jsonToActivity(jsonObject)
				activity = Activity.new
				
				if jsonObject.has_key?("id")
					activity.setId(jsonObject["id"])
				end
				if jsonObject.has_key?("name")
					activity.setName(jsonObject["name"])
				end
				if jsonObject.has_key?("state")
					activity.setState(jsonObject["state"])
				end
				if jsonObject.has_key?("activity_by")
					activity.setActivityBy(jsonObject["activity_by"])
				end
				if jsonObject.has_key?("time_long")
					activity.setTimeLong(jsonObject["time_long"])
				end
				if jsonObject.has_key?("display_time")
					activity.setDisplayTime(jsonObject["display_time"])
				end
				if jsonObject.has_key?("time")
					activity.setTime(jsonObject["time"])
				end
				if jsonObject.has_key?("activity_for")
					activity.setActivityFor(jsonObject["activity_for"])
				end
					
				return activity
				
			end

			# * Parse the JSON response and make it into List of Status object.
			#
			# ==== Parameters
			# 
			# * response:: - This JSON response contains the details of a statuses.
			#
			# ==== Returns
			#  
			# * List of Status object.

			def getStatuses(response)
				statuses_all_json = JSON.parse response
				statuses_all_array = statuses_all_json["statuses"]
				statuses_class_array = Array.new
				for i in 0...statuses_all_array.length
					statuses_class_array.push(jsonToStatus(statuses_all_array[i]))
				end
				return statuses_class_array
			end
			
			# * Parse the JSON response and make it into Status object.
			#
			# ==== Parameters
			#  
			# * response:: - This JSON response contains the details of a status.
			#  
			# * Status object.

			def getStatus(response)
				status_json = JSON.parse response
				status_array = status_json["statuses"]
				return jsonToStatus(status_array[0])
			end

			# * Parse the JSONObject into Status object.
			#  
		 	# * jsonObject:: - JSONObject contains the details of a status.
		 	#
			# ==== Returns
			#   
			# * Status object.

			def jsonToStatus(jsonObject)
				status = Status.new

				if jsonObject.has_key?("id")
					status.setId(jsonObject["id"])
				end
				if jsonObject.has_key?("content")
					status.setContent(jsonObject["content"])
				end
				if jsonObject.has_key?("posted_by")
					status.setPostedBy(jsonObject["posted_by"])
				end
				if jsonObject.has_key?("posted_person")
					status.setPostedPerson(jsonObject["posted_person"])
				end
				if jsonObject.has_key?("posted_time")
					status.setPostedTime(jsonObject["posted_time"])
				end
				if jsonObject.has_key?("posted_time_long")
					status.setPostedTimeLong(jsonObject["posted_time_long"])
				end
				if jsonObject.has_key?("posted_time_format")
					status.setPostedTimeFormat(jsonObject["posted_time_format"])
				end
				
				return status;
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