#  $Id$ 
module Projects
	module Model
		# * This class is used to make an object for TimelogList.

		class TimelogList < Array

			private
			attr_accessor :grandtotal, :role

			public

				# * Set the grand total of the time log.
				# 
				# ==== Parameters
				# 
				# * grandtotal:: - Grand total of the time log.

				def setGrandtotal(grandtotal)
					@grandtotal = grandtotal
				end

				# * Get the grand total of the time log.
				#
				# ==== Returns
				#  
				# * The grand total of the timelog.
				
				def getGrandtotal
					return grandtotal
				end

				# * Set the time log role.
				# 
				# ==== Parameters
				#  
				# * role:: - Role for the time log.
				
				def setRole(role)
					@role = role
				end

				# * Get the time log role.
				#
				# ==== Returns
				#   
				# * The time log role.
				
				def getRole
					return @role
				end
		end
	end
end