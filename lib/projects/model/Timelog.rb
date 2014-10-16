#  $Id$ 
module Projects
	module Model
		# * This class is used to make an object for Timelog.

		class Timelog 

			private 
				attr_accessor :dateLong, :displayFormat, :totalHours, :buglogs, :tasklogs, :generallogs

			public

				# * Set the date for the time log.
				# 
				# ==== Parameters
				#  
				# * dateLong:: - Date for the time log.

				def setDateLong(dateLong)
					@dateLong = dateLong
				end

				# * Get the date long of the time log.
				#
				# ==== Returns
				#   
				# * date of the time log.
				
				def getDateLong
					return @dateLong
				end

				# * Set the display format for the date.
				# 
				# ==== Parameters
				#  
				# * displayFormat:: - Display format for the date.
				
				def setDisplayFormat(displayFormat)
					@displayFormat = displayFormat
				end

				# * Get the display format of the date.
				#
				# ==== Returns
				#   
				# * display format of the date.
				
				def getDisplayFormat
					return @displayFormat
				end

				# * Set the total hours for the time log.
				# 
				# ==== Parameters
				#  
				# * totalHours:: - Total hours for the time log.
				
				def setTotalHours(totalHours)
					@totalHours = totalHours
				end

				# * Get the total hours of the time log.
				#
				# ==== Returns
				#  
				# * total hours of the time log.
				
				def getTotalHours
					return @totalHours
				end

				# * Set the bug logs.
				# 
				# ==== Parameters
				# 
				# * buglogs:: - List of Buglog object.
				
				def setBuglogs(buglogs)
					@buglogs = buglogs
				end

				# * Get the bug logs.
				#
				# ==== Returns
				#   
				# * List of Buglog object.
				
				def getBuglogs
					return @buglogs
				end

				# * Set the task logs.
				# 
				# ==== Parameters
				#  
				# * tasklogs:: - List of Tasklog object.
				
				def setTasklogs(tasklogs)
					@tasklogs = tasklogs
				end

				# * Get the task logs.
				#
				# ==== Returns
				#   
				# * List of Tasklog object.
				
				def getTasklogs
					return @tasklogs
				end

				# * Set the general logs.
				# 
				# ==== Parameters
				#  
				# * generallogs:: - List of Generallog object.
				
				def setGenerallogs(generallogs)
					@generallogs = generallogs
				end

				# * Get the general logs.
				#
				# ==== Returns
				#   
				# * List of Generallog object.
				
				def getGenerallogs
					return @generallogs
				end
		end
	end
end