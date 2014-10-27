# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zohoProjects/version'

Gem::Specification.new do |spec|
  spec.name          = "zohoProjects"
  spec.version       = ZohoProjects::VERSION
  spec.authors       = ["Zoho Corp."]
  spec.email         = ["arivezhilmarban@gmail.com"]
  spec.summary       = %q{Wrapper for Zoho Projects.}
  spec.description   = %q{Zoho Projects API lets, users/developers extend their web applications to push or pull data into or from Zoho Projects for application mashups. - See more at: http://cms.zohocorp.com/export/zoho/projects/help/rest-api/zohoprojectsapi.html}
  spec.homepage      = ""
  spec.license       = "MIT"


  spec.files         = %w[
                            Gemfile
                            Gemfile.lock
                            LICENSE
                            Rakefile
                            README.md
                            zohoProjects.gemspec
                            lib/zohoProjects.rb
                            lib/zohoProjects/version.rb
                            lib/projects/api/API.rb
                            lib/projects/api/PortalAPI.rb
                            lib/projects/api/ProjectsAPI.rb
                            lib/projects/api/MilestonesAPI.rb
                            lib/projects/api/TasklistsAPI.rb
                            lib/projects/api/TasksAPI.rb
                            lib/projects/api/TimesheetsAPI.rb
                            lib/projects/api/FoldersAPI.rb
                            lib/projects/api/DocumentsAPI.rb
                            lib/projects/api/EventsAPI.rb
                            lib/projects/api/BugsAPI.rb
                            lib/projects/api/ForumsAPI.rb
                            lib/projects/api/UsersAPI.rb
                            lib/projects/model/Activity.rb
                            lib/projects/model/Bug.rb
                            lib/projects/model/Buglog.rb
                            lib/projects/model/Category.rb
                            lib/projects/model/Comment.rb
                            lib/projects/model/Customfield.rb
                            lib/projects/model/Defaultfield.rb
                            lib/projects/model/Document.rb
                            lib/projects/model/Event.rb
                            lib/projects/model/Folder.rb
                            lib/projects/model/Forum.rb
                            lib/projects/model/Generallog.rb
                            lib/projects/model/Log.rb
                            lib/projects/model/Milestone.rb
                            lib/projects/model/Owner.rb
                            lib/projects/model/Participant.rb
                            lib/projects/model/Portal.rb
                            lib/projects/model/Project.rb
                            lib/projects/model/Status.rb
                            lib/projects/model/Task.rb
                            lib/projects/model/Tasklist.rb
                            lib/projects/model/Tasklog.rb
                            lib/projects/model/Timelog.rb
                            lib/projects/model/TimelogList.rb
                            lib/projects/model/User.rb
                            lib/projects/model/Version.rb
                            lib/projects/parser/BugParser.rb
                            lib/projects/parser/DocumentParser.rb
                            lib/projects/parser/EventParser.rb
                            lib/projects/parser/FolderParser.rb
                            lib/projects/parser/ForumParser.rb
                            lib/projects/parser/MilestonesParser.rb
                            lib/projects/parser/PortalParser.rb
                            lib/projects/parser/ProjectParser.rb
                            lib/projects/parser/TasklistParser.rb
                            lib/projects/parser/TaskParser.rb
                            lib/projects/parser/TimesheetParser.rb
                            lib/projects/parser/UserParser.rb
                            lib/projects/util/ZohoHTTPClient.rb
                            lib/projects/exception/ProjectsException.rb
                            lib/projects/service/ZohoProject.rb
                          ]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
