#  $Id$ 
module Projects
	module Model
		require File.dirname(__FILE__) + '/Log'

		# * This class is used to make an object for Tasklog.

		class Tasklog < Log
			
			private 
				attr_accessor :taskId, :taskName

			public

				# * Set the task id.
				# 
				# ==== Parameters
				#  
				# * taskId:: - ID of the task.

				def setTaskId(taskId)
					@taskId = taskId
				end

				# * Get the task id.
				#
				# ==== Returns
				#  
				# * ID of the task.
				
				def getTaskId
					return @taskId
				end

				# * Set the task name.
				# 
				# ==== Parameters
				# 
				# * taskName:: - Name of the task.
				
				def setTaskName(taskName)
					@taskName = taskName
				end

				# * Get the task name.
				#
				# ==== Returns
				#  
				# * Task name.
				
				def getTaskName
					return @taskName
				end
		end
	end
end