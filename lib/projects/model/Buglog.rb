#  $Id$ 
module Projects
	module Model
		require File.dirname(__FILE__) + '/Log'

		# * This class is used to make an object for Buglog.

		class Buglog < Log
			
			private 
				attr_accessor :bugId, :title

			public
			
				# * Set the bug id.
				# 
				# ==== Parameters
				# 
				# * bugId:: - ID of the bug.

				def setBugId(bugId)
					@bugId = bugId
				end

				# * Get the bug id.
				#
				# ==== Returns
				#   
				# * Bug id.
				
				def getBugId
					return @bugId
				end
			
				# * Set the title of the bug.
				# 
				# ==== Parameters
				#  
				# * title:: - Title of the bug.

				def setTitle(title)
					@title = title
				end

				# * Get the title of the bug.
				#
				# ==== Returns
				#   
				# * Title of the bug.

				def getTitle
					return @title
				end
		end
	end
end
