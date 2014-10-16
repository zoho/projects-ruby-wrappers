# ZohoProjects

The ruby library for integrating with ZohoProjects.

## Installation

Add this line to your application's Gemfile:

    gem 'zohoProjects'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zohoProjects

## Documentation

[API Documentation](http://cms.zohocorp.com/export/zoho/projects/help/rest-api/portals-api.html)

## Usage

If you want to use all our zoho projects services API you should have a valid Zoho username, password and a valid authtoken.

How to generate your authtoken? [Refer Here](http://cms.zohocorp.com/export/zoho/projects/help/rest-api/get-tickets-api.html)

If you have a valid authtoken, you are able to access our Zoho projects API wrappers.

How to access our wrapper classes? Here is a sample example code for accessing Zoho Projects.

You have to add our gem file:

	require "zohoProjects"

Pass your authToken to create an instance for PortalsAPI.

You have two ways to create an instance for PortalsAPI. Here is the example code,

1) Pass your authToken and create a PortalsAPI instance:

			portalsAPI = PortalsAPI.new("{auth_token}")
			
2) Pass your authToken and portalId to create an instance for ZohoProjects and then get the instance for PortalsAPI:

			zohoProject = ZohoProject.new("{auth_token}", "{portal_id}")
			
			portalsAPI = zohoProject.getPortalsAPI
			
	
			queryMap = Hash.new
			
			queryMap["status"] = "open"
			
			begin
			
## Get the list of portals:

- - -
			
If you want to get all your portals, you need to call the 'getPortals' method. It returns the List of Portal object.

				portals = portalsAPI.getPortals
			
If you want to parse the portal id from the List of Portal object then you need to write your code as mentioned below:

				portalId = portals[0].getId
			
## Get the list of projects:

- - -

If you want to get all the projects from the portal, you need to call the 'getProjects' method by passing query string parameters.

				projects = projectsAPI.getProjects(queryMap)
			
If you want to parse the project id from the List of Project object then you need to write your code as mentioned below:

				projectId = String(projects[0].getId)
			
## Get the details of a project:

- - -

If you want to get the details of project, you need to call the 'get' method by passing projectId.

				get = projectsAPI.get(projectId)
			
## Create a new project:

- - -

If you want to create a new project for the portal, you need to call the 'create' method by passing the Project object.

				project = Project.new
			
				project.setName("Test")
				project.setDescription("Test project")

				create = projectsAPI.create(project)
			
## Update the details of a project:

- - - 

If you want to update the project details of a portal, you need to fetch the project details by calling the 'get' method.

If you want update the name of the project then you need to write your code as mentioned below:

				get = projectsAPI.get(projectId)
			
				get.setName("API")

				update = projectsAPI.update(get)
			
			
## Delete an existing project:

- - - 

If you want to delete an existing project for the portal, you need to call the `delete()` method by passing projectId.

				delete = projectsAPI.delete(projectId)
		
			
## Catch the exception:

- - -

When calling Zoho Projects API wrappers if there is any error then the respective class throws the ProjectsException. You need to catch the ProjectsException as mentioned below:
			
			rescue ProjectsException => pe
				puts "Code: " + String(pe.getCode)
  				puts "Message: " + pe.getMessage
			end
	
See [Here](../../tree/master/test) for full examples.
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
