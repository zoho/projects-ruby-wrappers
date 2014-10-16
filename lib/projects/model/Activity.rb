#  $Id$ 
module Projects
	module Model
		# * This class is used to make an object for Activity.

		class Activity
			private
				attr_accessor :id, :name, :state, :activityBy, :timeLong, :displayTime, :time, :activityFor
			
			public
			
				# * Set the id of the activity.
				# 
				# ==== Parameters
				#  
				# * id:: - ID of the activity.

				def setId(id)
					@id = id
				end

				# * Get the activity id.
				#
				# ==== Returns
				#
				# * Activity id.
			
				def getId
					return @id
				end
			
				# * Set the name of the activity.
				# 
				# ==== Parameters
				#
				# * name:: - Name of the activity.

				def setName(name)
					@name = name
				end

				# * Get the activity name.
				#
				# ==== Returns
				#
				# * Activity name.
			
				def getName
					return @name
				end
			
				# * Set the state of the activity.
				# 
				# ==== Parameters
				# 
				# * state:: - State of the activity.
			
				def setState(state)
					@state = state
				end

				# * Get the activity state.
				#
				# ==== Returns
				#  
				# * Activity state.
			
				def getState
					return @state
				end

				# * Set who posted the activity.
				# 
				# ==== Parameters
				#  
				# * activityBy:: - User who posted the activity. 

				def setActivityBy(activityBy)
					@activityBy = activityBy
				end

				# * Get who posted the activity.
				#
				# ==== Returns
				#  
				# * User who posted the activity.
			
				def getActivityBy
					return @activityBy
				end
			
				# * Set the time long.
				# 
				# ==== Parameters
				#  
				# * timeLong:: - Time for the activity.

				def setTimeLong(timeLong)
					@timeLong = timeLong
				end

				# * Get the time long.
				#
				# ==== Returns
				# 
				# * Time for the activity.
			
				def getTimeLong
					return timeLong
				end
			
				# * Set the display time for the activity.
				# 
				# ==== Parameters
				#  
				# * displayTime:: - Display time for the activity.
				
				def setDisplayTime(displayTime)
					@displayTime = displayTime
				end

				# * Get the display time for the activity.
				#
				# ==== Returns
				#  
				# * Display time for the activity.
			
				def getDisplayTime
					return @displayTime
				end
			
				# * Set the time for the activity done.
				# 
				# ==== Parameters
				#  
				# * time:: - Time for the activity done.
				
				def setTime(time)
					@time = time
				end
			
				# * Get the time for the activity done.
				#
				# ==== Returns
				# 
				# * Time for the activity done.
				
				def getTime
					return @time
				end
			
				# * Set the activity for which topic.
				# 
				# ==== Parameters
				#  
				# * activityFor:: - Topic fo the Activity.
				
				def setActivityFor(activityFor)
					@activityFor = activityFor
				end
			
				# * Get the activity for which topic.
				#
				# ==== Returns
				#
				# * Th topic of the activity.
				
				def getActivityFor
					return @activityFor
				end
		end
	end
end