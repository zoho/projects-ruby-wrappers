#  $Id$ 
module Projects
	module Service

		require File.dirname(__FILE__).chomp("/projects/service") + '/projects/api/PortalAPI'
		require File.dirname(__FILE__).chomp("/projects/service") + '/projects/api/ProjectsAPI'
		require File.dirname(__FILE__).chomp("/projects/service") + '/projects/api/MilestonesAPI'
		require File.dirname(__FILE__).chomp("/projects/service") + '/projects/api/TasklistsAPI'
		require File.dirname(__FILE__).chomp("/projects/service") + '/projects/api/TasksAPI'
		require File.dirname(__FILE__).chomp("/projects/service") + '/projects/api/TimesheetsAPI'
		require File.dirname(__FILE__).chomp("/projects/service") + '/projects/api/FoldersAPI'
		require File.dirname(__FILE__).chomp("/projects/service") + '/projects/api/DocumentsAPI'
		require File.dirname(__FILE__).chomp("/projects/service") + '/projects/api/EventsAPI'
		require File.dirname(__FILE__).chomp("/projects/service") + '/projects/api/BugsAPI'
		require File.dirname(__FILE__).chomp("/projects/service") + '/projects/api/ForumsAPI'
		require File.dirname(__FILE__).chomp("/projects/service") + '/projects/api/UsersAPI'

		# * ZohoProjects is used to provide all API instances for the Zoho Project services.

		class ZohoProject
			include Projects::Api

			private
				attr_accessor :authToken, :portalId

			public
			
				# * Initialize ZhoProjects using user's authToken and portalId.
				#
				# ==== Parameters
				# 
				# * authToken:: - User's authToken.
			 	#
				# * portalId:: - User's portalId.

				def initialize(authToken,portalId)
					@authToken = authToken
					@portalId = portalId
				end
				
				# * Get an instance of portals API.
				#
				# ==== Returns
				#  
				# * PortalsAPI object.

				def getPortalsAPI
					portalsAPI = PortalAPI.new(authToken)		
					return portalsAPI
				end
			
				# * Get an instance of projects API.
				#
				# ==== Returns
				# 
				# * ProjectsAPI object.

				def getProjectsAPI
					projectsAPI = ProjectsAPI.new(authToken, portalId)		
					return projectsAPI
				end
			
				# * Get an instance of milestones API.
				#
				# ==== Returns
				#
				# * MilestonesAPI object.

				def getMilestonesAPI
					milestonesAPI = MilestonesAPI.new(authToken, portalId)	
					return milestonesAPI
				end
			
				# * Get an instance of task lists API.
				#
				# ==== Returns
				#  
				# * TasklistsAPI object.

				def getTasklistsAPI
					tasklistsAPI = TasklistsAPI.new(authToken, portalId)		
					return tasklistsAPI
				end
			
				# * Get an instance of tasks API.
				#
				# ==== Returns
				#  
				# * TasksAPI object.

				def getTasksAPI
					tasksAPI = TasksAPI.new(authToken, portalId)	
					return tasksAPI
				end
			
				# * Get an instance of events API.
				#
				# ==== Returns
				#  
				# * EventsAPI object.

				def getEventsAPI
					eventsAPI = EventsAPI.new(authToken, portalId)		
					return eventsAPI
				end
			
				# * Get an instance of folder API.
				#
				# ==== Returns
				#  
				# * FoldersAPI object.

				def getFoldersAPI
					foldersAPI = FoldersAPI.new(authToken, portalId)	
					return foldersAPI
				end
				
				# * Get an instance of documents API.
				#
				# ==== Returns
				#  
				# * DocumentsAPI object.

				def getDocumentsAPI
					documentsAPI = DocumentsAPI.new(authToken, portalId)		
					return documentsAPI
				end
			
				# * Get an instance of forums API.
				#
				# ==== Returns
				#  
				# * ForumsAPI object.

				def getForumsAPI
					forumsAPI = ForumsAPI.new(authToken, portalId)		
					return forumsAPI
				end
			
				# * Get an instance of users API.
				#
				# ==== Returns
				#  
				# * UsersAPI object.

				def getUsersAPI
					usersAPI = UsersAPI.new(authToken, portalId)		
					return usersAPI
				end
			
				# * Get an instance of bugs API.
				#
				# ==== Returns
				#  
				# * BugsAPI object.

				def getBugsAPI
					bugsAPI = BugsAPI.new(authToken, portalId)		
					return bugsAPI
				end
			
				# * Get an instance of time sheets API.
				#
				# ==== Returns
				#  
				# * TimesheetsAPI object.

				def getTimesheetsAPI
					timesheetsAPI = TimesheetsAPI.new(authToken, portalId)		
					return timesheetsAPI
				end
		end
	end
end
