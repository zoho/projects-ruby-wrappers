# ZohoProjects Ruby Client Library


The Ruby library for integrating with the Zoho Projects API. Use this object-based Ruby wrapper to easily integrate Zoho Projects modules like portals, projects, milestones, tasklists, events etc. into your application.

## Installation


There are a couple of ways of installing ZohoProjects:

Install 1:

Start by adding this line to your application's Gemfile: 

      gem 'zohoProjects'

And follow it with executing this command:
 
      $ bundle

Install 2:

To fully install the Projects wrapper yourself, just execute this command:

      $ gem install zohoProjects

## Documentation


[API Reference](https://www.zoho.com/projects/help/rest-api/zohoprojectsapi.html)

## Usage


In order to access the Zoho Projects APIs, users need to have a valid Zoho account and a valid Auth Token.

### Sign up for a Zoho Account:

- - -

For setting up a Zoho account, access the Zoho Projects [Sign Up](https://www.zoho.com/projects/zp-signup.html) page and enter the requisite details - email address and password.

### Generate Auth Token:

- - -
 
To generate the Auth Token, you need to send an authentication request to Zoho Accounts in a prescribed URL format. [Refer here](https://www.zoho.com/projects/help/rest-api/get-tickets-api.html)


## Ruby Wrappers - Sample

### How to access the Zoho Projects APIs through Ruby wrapper classes?

- - -

To access the Projects APIs, add this gem file in your application:
	
	require "zohoProjects"
	
### Create PortalsAPI instance:

- - -

Now there are two ways of creating an instance of PortalsAPI.

Pass the AuthToken and create a PortalsAPI instance. 

Sample code:

        portalsAPI = PortalsAPI.new("{auth_token}")

Pass the AuthToken and PortalId to first create an instance of ZohoProjects, and then proceed to get the instance of PortalsAPI. 

Sample code:
       	
       	zohoProject = ZohoProject.new("{auth_token}", "{portal_id}")
 
        portalsAPI = zohoProject.getPortalsAPI
 
 
        queryMap = Hash.new
 
        queryMap["status"] = "open"
 
        begin
 
 
### List all Portals:

- - -

If you wish to get the list of all your Zoho Projects portals, you need to call the `getPortals()` method by passing query string parameters in the format below:

            portals = portalsAPI.getPortals
 
It returns the List of Portal object as a response.

Similarly, if you wish to parse the portal id from the List of Portal objects, you need to send a request in the prescribed format below:

            portalId = portals.get[0].getId
 
### List all Projects:

- - -

If you wish to get the list of all projects from the portal, you need to call the `getProjects()` method by passing query string parameters in the format below:

            projects = projectsAPI.getProjects(queryMap)
 
It returns the List of Project object as a response.
 
Similarly, if you wish to parse the project id from the List of Portal objects, you need to send a request in the format below:

            projectId = String.valueOf(projects[0].getId)
 
### Get Project details:

- - - 
 
In order to get the details of a project, you need to call the `get()` method by passing a projectId.
 
            get = projectsAPI.get(projectId)
 
### Create a new Project:

- - - 
 
To create a new project for the specific portal, you need to call the `create()` method by passing the Project object.

            project = Project.new
 
            project.setName("Test")
            project.setDescription("Test project")
 
            create = projectsAPI.create(project)

### Update Project details:

- - - 
 
To update the project details of a particular portal, you need to first fetch the project info. This can be achieved by calling the `get()` method. You can then proceed to update the name of the project (for example) with the help of a sample code below:

            get = projectsAPI.get(projectId)
 
            get.setName("API")
 
            update = projectsAPI.update(get)

### Delete a Project:

- - - 
 
To delete an existing project of a particular portal, you need to call the `delete()` method and pass the projectid.

            delete = projectsAPI.delete(projectId)
 
       

### Catch Exceptions:

- - -

If there is any error encountered while calling the Ruby Wrappers of Zoho Projects API, the respective class will throw the ProjectsException. Use the below mentioned code to catch the ProjectsException:

               rescue ProjectsException => pe
                puts "Code: " + String(pe.getCode)
                puts "Message: " + pe.getMessage
           end
 
 
For a full set of examples, click [here](https://github.com/zoho/projects-ruby-wrappers/tree/master/test).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
