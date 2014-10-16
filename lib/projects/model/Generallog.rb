#  $Id$ 
module Projects
	module Model
		require File.dirname(__FILE__) + '/Log'

		# * This class is used to make an object for Generallog.

		class Generallog < Log
			
			private 
				attr_accessor :name

			public
			
				# * Set the name fo the general log.
				# 
				# ==== Parameters
				#  
				# * name:: - Name of the general log.

				def setName(name)
					@name = name
				end

				# * Get the name of the general log.
				#
				# ==== Returns
				#  
				# * General log name.
				
				def getName
					return @name
				end
		end
	end
end