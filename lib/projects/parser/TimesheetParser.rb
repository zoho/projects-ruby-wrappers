#  $Id$ 
module Projects
	module Parser

		require 'json'
		require File.dirname(__FILE__).chomp("/projects/parser") + '/projects/model/Buglog'
		require File.dirname(__FILE__).chomp("/projects/parser") + '/projects/model/Generallog'
		require File.dirname(__FILE__).chomp("/projects/parser") + '/projects/model/Tasklog'
		require File.dirname(__FILE__).chomp("/projects/parser") + '/projects/model/Timelog'
		require File.dirname(__FILE__).chomp("/projects/parser") + '/projects/model/TimelogList'

		# * Parse the JSON response into respective objects.

		class TimesheetParser
			include Projects::Model

			# * Parse the JSON response and make it into TimelogList object.
			#
			# ==== Parameters
			#   
			# * response:: - This JSON response contains the details of time logs.
			#
			# ==== Returns
			#   
			# * TimelogList object.

			def getTimeLogs(response)
				timeLogs_json = JSON.parse response
				timeLogs_array = timeLogs_json["timelogs"]
				return jsonToTimelogList(timeLogs_array)
			end

			# * Parse the JSON response and make it into Tasklog object.
			#
			# ==== Parameters
			#  
			# * response:: - This JSON response contains the details of a task log.
			#
			# ==== Returns
			#  
			# * Tasklog object.
			
			def getTasklog(response)
				timeLogs_json = JSON.parse response
				tasklogs_array = timeLogs_json["timelogs"]["tasklogs"]
				return jsonToTasklog(tasklogs_array[0])
			end
			
			# * Parse the JSON response and make it into the Buglog object.
			#
			# ==== Parameters
			#  
			# * response:: - This JSON response contains the details of bug log.
			#
			# ==== Returns
			#   
			# * Buglog object.

			def getBuglog(response)
				timeLogs_json = JSON.parse response
				buglogs_array = timeLogs_json["timelogs"]["buglogs"]
				return jsonToBuglog(buglogs_array[0])
			end

			# * Parse the JSON response and make it into the Generallog object.
			#
			# ==== Parameters
			# 
			# * response:: - This JSON response contains the details of a general log.
			#
			# ==== Returns
			#   
			# * Generallog object.
			
			def getGenerallog(response)
				timeLogs_json = JSON.parse response
				generallogs_array = timeLogs_json["timelogs"]["generallogs"]
				return jsonToGenerallog(generallogs_array[0])
			end

			# * Parse the JSONObject into timlogList object.
			#
			# ==== Parameters
			#  
			# * jsonObject:: - JSONObject contains the details of a time logs.
			#
			# ==== Returns
			#   
			# * TimelogList object.
			
			def jsonToTimelogList(jsonObject)		
				timelogList = TimelogList.new
				
				if jsonObject.has_key?("grandtotal")
					timelogList.setGrandtotal(jsonObject["grandtotal"])
				end
				
				if jsonObject.has_key?("role")
					timelogList.setRole(jsonObject["role"])
				end
				
				if jsonObject.has_key?("date")
					
					date = jsonObject["date"]

					timelogObj = Timelog.new
					
					for i in 0...date.length
						dateObj = date[i]
						
						if dateObj.has_key?("date_long")
							timelogObj.setDateLong(dateObj["date_long"])
						end
						if dateObj.has_key?("display_format")
							timelogObj.setDisplayFormat(dateObj["display_format"])
						end
						if dateObj.has_key?("total_hours")
							timelogObj.setTotalHours(dateObj["total_hours"])
						end
						
						if dateObj.has_key?("buglogs")
							buglogs = dateObj["buglogs"]
							
							buglogList = Array.new
							
							for j in 0...buglogs.length
								buglog = buglogs[j]						
								buglogList.push(jsonToBuglog(buglog))
							end
							
							timelogObj.setBuglogs(buglogList)
						end
						
						if dateObj.has_key?("tasklogs")
							tasklogs = dateObj["tasklogs"]
							
							tasklogList = Array.new
							
							for k in 0...tasklogs.length
								tasklog = tasklogs[k]
								tasklogList.push(jsonToTasklog(tasklog))
							end
							
							timelogObj.setTasklogs(tasklogList)
						end
						
						if dateObj.has_key?("generallogs")
							generallogs = dateObj["generallogs"]
							
							generallogList = Array.new
							
							for l in 0...generallogs.length
								generallog = generallogs[l]
								generallogList.push(jsonToGenerallog(generallog))
							end
							
							timelogObj.setGenerallogs(generallogList)
						end
						timelogList.push(timelogObj)
					end
				end
					
				return timelogList
			end
			
			# * Parse the JSONObject into Buglog object.
			#
			# ==== Parameters
			#  
			# * jsonObject:: - JSONObject contains the details of a bug log.
			#
			# ==== Returns
			#  
			# * Buglog object.

			def jsonToBuglog(jsonObject)
				buglog = Buglog.new
				
				if jsonObject.has_key?("id")
					buglog.setId(jsonObject["id"])
				end
				if jsonObject.has_key?("notes")
					buglog.setNotes(jsonObject["notes"])
				end
				if jsonObject.has_key?("log_date")
					buglog.setLogDate(jsonObject["log_date"])
				end
				if jsonObject.has_key?("log_date_long")
					buglog.setLogDateLong(jsonObject["log_date_long"])
				end
				if jsonObject.has_key?("hours")
					buglog.setHours(jsonObject["hours"])
				end
				if jsonObject.has_key?("minutes")
					buglog.setMinutes(jsonObject["minutes"])
				end
				if jsonObject.has_key?("hours_display")
					buglog.setHoursDisplay(jsonObject["hours_display"])
				end
				if jsonObject.has_key?("total_minutes")
					buglog.setTotalMinutes(jsonObject["total_minutes"])
				end
				if jsonObject.has_key?("owner_id")
					buglog.setOwnerId(jsonObject["owner_id"])
				end
				if jsonObject.has_key?("owner_name")
					buglog.setOwnerName(jsonObject["owner_name"])
				end
				if jsonObject.has_key?("bill_status")
					buglog.setBillStatus(jsonObject["bill_status"])
				end
				
				if jsonObject.has_key?("bug")
					bug = jsonObject["bug"]
					
					if bug.has_key?("id")
						buglog.setBugId(bug["id"])
					end
					if bug.has_key?("title")
						buglog.setTitle(bug["title"])
					end
				end
				
				if jsonObject.has_key?("link")
					link = jsonObject["link"]
					
					if link.has_key?("self")
						buglog.setURL(link["self"]["url"])
					end
				end
				
				return buglog
			end

			# * Parse the JSONObject into Tasklog object.
			#
			# ==== Parameters
			#   
			# * jsonObject:: - JSONObject contains the details of a task log.
			#
			# ==== Returns
			#   
			# * Tasklog object.
			
			def jsonToTasklog(jsonObject)
				tasklog = Tasklog.new
				
				if jsonObject.has_key?("id")	
					tasklog.setId(jsonObject["id"])
				end
				if jsonObject.has_key?("notes")
					tasklog.setNotes(jsonObject["notes"])
				end
				if jsonObject.has_key?("log_date")
					tasklog.setLogDate(jsonObject["log_date"])
				end
				if jsonObject.has_key?("log_date_format")
					tasklog.setLogDateFormat(jsonObject["log_date_format"])
				end
				if jsonObject.has_key?("log_date_long")
					tasklog.setLogDateLong(jsonObject["log_date_long"])
				end
				if jsonObject.has_key?("hours")
					tasklog.setHours(jsonObject["hours"])
				end
				if jsonObject.has_key?("minutes")
					tasklog.setMinutes(jsonObject["minutes"])
				end
				if jsonObject.has_key?("hours_display")
					tasklog.setHoursDisplay(jsonObject["hours_display"])
				end
				if jsonObject.has_key?("total_minutes")
					tasklog.setTotalMinutes(jsonObject["total_minutes"])
				end
				if jsonObject.has_key?("owner_id")
					tasklog.setOwnerId(jsonObject["owner_id"])
				end
				if jsonObject.has_key?("owner_name")
					tasklog.setOwnerName(jsonObject["owner_name"])
				end
				if jsonObject.has_key?("bill_status")
					tasklog.setBillStatus(jsonObject["bill_status"])
				end
				
				if jsonObject.has_key?("task")
					task = jsonObject["task"]
					
					if task.has_key?("id")
						tasklog.setTaskId(task["id"])
					end
					if task.has_key?("name")
						tasklog.setTaskName(task["name"])
					end
				end
				
				if jsonObject.has_key?("link")
					link = jsonObject["link"]
					
					if link.has_key?("self")
						tasklog.setURL(link["self"]["url"])
					end
				end
				
				return tasklog
			end
			
			# * Parse the JSONObject into Generallog object.
			#
			# ==== Parameters
			#   
			# * jsonObject:: - JSONObject contains the details of a general log.
			#
			# ==== Returns
			#  
			# * Generallog object.
			
			def jsonToGenerallog(jsonObject)
				generallog = Generallog.new
				
				if jsonObject.has_key?("id")
					generallog.setId(jsonObject["id"])
				end
				if jsonObject.has_key?("name")
					generallog.setName(jsonObject["name"])
				end
				if jsonObject.has_key?("notes")
					generallog.setNotes(jsonObject["notes"])
				end
				if jsonObject.has_key?("log_date")
					generallog.setLogDate(jsonObject["log_date"])
				end
				if jsonObject.has_key?("log_date_format")
					generallog.setLogDateFormat(jsonObject["log_date_format"])
				end
				if jsonObject.has_key?("log_date_long")
					generallog.setLogDateLong(jsonObject["log_date_long"])
				end
				if jsonObject.has_key?("hours")
					generallog.setHours(jsonObject["hours"])
				end
				if jsonObject.has_key?("minutes")
					generallog.setMinutes(jsonObject["minutes"])
				end
				if jsonObject.has_key?("hours_display")
					generallog.setHoursDisplay(jsonObject["hours_display"])
				end
				if jsonObject.has_key?("total_minutes")
					generallog.setTotalMinutes(jsonObject["total_minutes"])
				end
				if jsonObject.has_key?("owner_id")
					generallog.setOwnerId(jsonObject["owner_id"])
				end
				if jsonObject.has_key?("owner_name")
					generallog.setOwnerName(jsonObject["owner_name"])
				end
				if jsonObject.has_key?("bill_status")
					generallog.setBillStatus(jsonObject["bill_status"])
				end
				
				
				if jsonObject.has_key?("link")
					link = jsonObject["link"]
					
					if link.has_key?("self")
						generallog.setURL(link["self"]["url"])
					end
				end
				
				return generallog
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