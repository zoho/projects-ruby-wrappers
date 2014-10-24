#  $Id$ 
require "zohoProjects"

begin

	portalsAPI = PortalAPI.new("{auth_token}")
	portals = portalsAPI.getPortals

	portal_id = portals[0].getId


	zohoProjects = ZohoProjects.new("{auth_token}",portal_id)

	projectAPI = zohoProjects.getProjectsAPI

	milestoneAPI = zohoProjects.getMilestonesAPI

	tasklistAPI = zohoProjects.getTasklistsAPI

	tasksAPI = zohoProjects.getTasklistsAPI

	eventsAPI = zohoProjects.getEventsAPI

	foldersAPI = zohoProjects.getFoldersAPI

	documentsAPI = zohoProjects.getDocumentsAPI

	forumsAPI = zohoProjects.getForumsAPI

	usersAPI = zohoProjects.getUsersAPI

	bugsAPI = zohoProjects.getBugsAPI
			
	forumsAPI = zohoProjects.getForumsAPI
			
	timesheetsAPI = zohoProjects.getTimesheetsAPI

	projectAPI = ProjectsAPI.new("{auth_token}",portal_id)

	projectAll = projectAPI1.getProjects

	queryMap = Hash.new
	queryMap["status"] = "active"

	project = projectAPI.getProjects(queryMap)

	project_id = projectAll[0].getId

	project_ownerId = projectAll[0].getOwnerId

	project = Project.new
	project.setName("Test Project")
	project.setDescription("This is a Test Project")
	
	create = projectAPI.createProject(project)
	
	get = projectAPI.get(projectAll[0].getId)
	
	get.setName("Test Project");
	get.setDescription("This is a Test Project")
	get.setStatus("active")
	update = projectAPI.updateProject(get)
	
	activity = projectAPI.getProjectActivities(project_id)
	
	status = projectAPI.getProjectStatuses(project_id)
	
	status1 = Status.new
	status1.setContent("New Status Added")
	status2 = projectAPI.addProjectStatus(project_id, status1)

	milestonesAPI = MilestonesAPI.new("{auth_token}",portal_id)

	milestone = milestonesAPI.getMilestones(project_id)

	milestone_id = milestone.getId
	
	milestone1 = milestonesAPI.get(project_id,milestone_id)
	
	result = milestonesAPI.delete(project_id,milestone_id)

	milestone = Milestone.new
	milestone.setName("My first Updated Milestone")
	milestone.setStartDate("07-01-2014")
	milestone.setEndDate("07-20-2014")
	milestone.setOwnerId(project_ownerId.to_i)
	milestone.setFlag("internal")

	milestone1 = milestonesAPI.create(project_id, milestone)
	
	milestone =  milestonesAPI.update(project_id, milestone1)

	puts milestonesAPI.updateStatus(project_id, milestone_id, 1)

	tasklistsAPI = TasklistsAPI.new("{auth_token}",portal_id)

	queryMap = Hash.new
	queryMap["flag"] = "internal"

	tasklists = tasklistsAPI.getTasklists(project_id, queryMap)

	result = tasklistsAPI.delete(project_id, tasklists[0].getId)

	tasklist = Tasklist.new()
	tasklist.setName("Model")
	tasklist.setFlag("internal")
	
	milestone1 = Milestone.new()
	milestone1.setId(milestone_id)
	tasklist.setMilestone(milestone1)
	
	createTasklist = tasklistsAPI.create(project_id, tasklist)

	tasklists[0].setName("Model 1")
	tasklists[0].setFlag("internal")
	tasklists[0].setStatus("completed")

	tasklist = tasklistsAPI.update(project_id, tasklists[0])

	queryMap = Hash.new
	queryMap["range"] = 1
	
	tasksAPI = TasksAPI.new("{auth_token}",portal_id)
	
	tasks = tasksAPI.getTasks(project_id, queryMap)
	
	tasklistId = tasks[0].getTasklist.getId
	
	tasklistTasks = tasksAPI.getTasklistTasks(project_id, tasklistId, nil)
	
	taskId = tasklistTasks[0].getId
	getTask = tasksAPI.get(project_id, taskId)
	
	task = tasks[0]
	puts task.getName

	owner1 = task.getOwners

	owners = Array.new
	owner = Owner.new
	owner.setId(owner1.getId)
	owners.push(owner)
	
	task.setOwners(owners)
	task.setName("complete TasksAPI 1")
	task.setStartDate("06-23-2014")
	task.setEndDate("06-30-2014")
	
	createTask = tasksAPI.create(project_id, task)
	
	updateTask = tasksAPI.update(project_id, task)
	
	subtasks = tasksAPI.getSubtasks(project_id, taskId, nil)
	
	taskComments = tasksAPI.getComments(project_id, taskId, nil)
	
	addTaskComment = tasksAPI.addComment(project_id, taskId, "Test Comment")
	
	deleteTaskComment = tasksAPI.deleteComment(project_id, taskId, taskComments[0].getId)
	
	deleteTask = tasksAPI.delete(project_id, String(task.getId))

	queryMap = Hash.new
	queryMap["user_list"] = "all"
	queryMap["view_type"] = "month"
	queryMap["date"] = "06-23-2014"
	queryMap["bill_status"] = "Billable"
	queryMap["component_type"] = "task"

	timesheetsAPI = TimesheetsAPI.new("{auth_token}",portal_id)
	
	timeLogs = timesheetsAPI.getTimeLogs(project_id, queryMap)
	
	tasklog = timeLogs[0].getTasklogs
	
	tasklog[0].setDate("07-02-2014")
					
	addTasklog = timesheetsAPI.addTasklog(project_id, tasklog[0])
						
	updateTasklog = timesheetsAPI.updateTasklog(project_id, tasklog[0])
					
	deleteTasklog = timesheetsAPI.deleteTasklog(project_id, String(tasklog[0].getTaskId), String(tasklog[0].getId))
						
	buglog = timeLogs[0].getBuglogs[0]
				
	buglog.setDate("06-28-2014")
	buglog.setBillStatus("Billable")
	buglog.setHours("02:02")
					
	addBuglog = timesheetsAPI.addBuglog(project_id, buglog)
					
	updateBuglog = timesheetsAPI.updateBuglog(project_id, buglog)
				
	deleteBuglog = timesheetsAPI.deleteBuglog(project_id, String(buglog.getBugId), String(buglog.getId))
					
	generallog = timeLogs[0].getGenerallogs[0]	
	generallog.setDate("06-25-2014")
	generallog.setBillStatus("Billable")
	generallog.setName("Complete API files New")
	generallog.setHours(1)
	generallog.setNotes("ss")
					
	addGenerallog = timesheetsAPI.addGenerallog(project_id, generallog)
	
	updateGenerallog = timesheetsAPI.updateGenerallog(project_id, generallog)
						
	deleteGenerallog = timesheetsAPI.deleteGenerallog(project_id, String(generallog.getId))
	
	bugsAPI = BugsAPI.new("{auth_token}",portal_id)

	bugs = bugsAPI.getBugs(project_id, nil)
	bugId = String(bugs[0].getId)
	getBug = bugsAPI.get(project_id, bugId)

	getBug.setTitle("Every thing is ok")
	getBug.setDescription("This is a bug")
	getBug.setDueDate("06-26-2014")
					
	createBug = bugsAPI.create(project_id, getBug)
					
	updateBug = bugsAPI.update(project_id, getBug)
	
	defaultFields = bugsAPI.getDefaultfields(project_id)
	
	customFields = bugsAPI.getCustomfields(project_id)
					
	deleteBug = bugsAPI.delete(project_id, bugId)

	queryMap = Hash.new
	queryMap["status"] = "open"
	
	eventsAPI = EventsAPI.new("{auth_token}",portal_id)
	events = eventsAPI.getEvents(project_id, queryMap)
	puts events[0].getParticipants
					
	event = events[0]
					
	event.setTitle("Wrapper publish")
	event.setHour("2")
	event.setMinutes("30")
	event.setAMPM("pm")
	event.setScheduledOn("06-24-2014")
				
	add = eventsAPI.add(project_id, event)
			
	updateEvent = eventsAPI.update(project_id, event)
	
	deleteEvent = eventsAPI.delete(project_id, String(event.getId))
	
	foldersAPI = FoldersAPI.new("{auth_token}",portal_id)
	folders = foldersAPI.getFolders(project_id)				
	folderId = folders[0].getId				
	folder = folders[0]
	folder.setName("Sample Updated")
				
	addFolder = foldersAPI.addFolder(project_id, folder);
	
	updateFolder = foldersAPI.updateFolder(project_id, folder)

	deleteFolder = foldersAPI.deleteFolder(project_id, String(updateFolder.getId))
	
	documentsAPI = DocumentsAPI.new("{auth_token}",portal_id)

	documents = documentsAPI.getDocuments(project_id, nil)
	
	documentId = String(documents[0].getId)
				
	getDocument = documentsAPI.get(project_id, documentId, nil)
	
	folderId = documents[0].getFolder.getId
						
	uploaddoc = Array.new
	file = File.new("File url")
	uploaddoc.push(file)
	uploaddoc.push(file)				

	getDocument.setFolderId(folderId)
	getDocument.setDescription("File Updated !!!")
	getDocument.setUploaddoc(uploaddoc)

	addDocument = documentsAPI.add(project_id, getDocument)
						
	updateDocument = documentsAPI.update(project_id, getDocument)
						
	deleteDocument = documentsAPI.delete(project_id, documentId)

	forumsAPI = ForumsAPI.new("{auth_token}",portal_id)

	categories = forumsAPI.getCategories(project_id)
	categoryId = categories[0].getId

	forums = forumsAPI.getForums(project_id, nil)
		
	forumId = forums[0].getId

	forum = Forum.new				
	uploadFile = Array.new
					
	file1 = File.new("File url")
	uploadFile.push(file1);
	uploadFile.push(file1);
					
	forum.setName("API Discussion New")
	forum.setContent("Discuss about projects API wrappers")
	forum.setUploadfile(uploadFile)
	forum.setCategoryId(categoryId)
					
	addForum = forumsAPI.add(project_id, forum)
				
	updateForum = forumsAPI.update(project_id, forum)
					
	deleteForum = forumsAPI.delete(project_id, String(addForum.getId))
				
	category.setName("API")
					
	addCategory = forumsAPI.addCategory(projectId, category)
					
	comments = forumsAPI.getComments(project_id, forumId,nil);
					
	comment = comments[0]

	comment=Comment.new				
	comment.setContent("URL changes not added in the document.")
					
	addComment = forumsAPI.addComment(project_id, forumId, comment)

	usersAPI = UsersAPI.new("{auth_token}",portal_id)
	users = usersAPI.getUsers(project_id)

rescue ProjectsException => pe
  puts "Code: " + String(pe.getCode)
  puts "Message: " + pe.getMessage
end
