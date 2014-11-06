#  $Id$ 
module Projects
	module Parser

		require 'json'
		require File.dirname(__FILE__).chomp("/projects/parser") + '/projects/model/Portal'
		
		# * Parse the JSON response into respective objects.

		class PortalParser
			include Projects::Model
			# * Parse the JSON response and make it into List of Portal object.
			#
			# ==== Parameters
			#   
			# * response:: - This JSON response contains the details of portals.
			#
			# ==== Returns
			#   
			# * List of Portal object.

			def getPortals(response)
				portals_all_json = JSON.parse response
				portals_all_array = portals_all_json["portals"]
				portal_class_array = Array.new
				for i in 0...portals_all_array.length
					portal_class_array.push(getPortal(portals_all_array[i]))
				end
				return portal_class_array
			end

			# * Parse the JSONObject into Portal object.
			#
			# ==== Parameters
			#   
			# * jsonObject:: - JSONObject contains the details of a Portal.
			#
			# ==== Returns
			#  
			# * Portal object.

			def getPortal(jsonObject)
				portal = Projects::Model::Portal.new	
				if jsonObject.has_key?("id")
					portal.setId(jsonObject["id"])
				end
				if jsonObject.has_key?("id_string")
					portal.setIdString(jsonObject["id_string"])
				end
				if jsonObject.has_key?("name")
					portal.setName(jsonObject["name"])
				end
				if jsonObject.has_key?("default")
					portal.setDefault(jsonObject["default"])
				end
				if jsonObject.has_key?("gmt_time_zone")
					portal.setGmtTimeZone(jsonObject["gmt_time_zone"])
				end
				if jsonObject.has_key?("role")
					portal.setRole(jsonObject["role"])
				end

				if jsonObject.has_key?("settings")
					settings = jsonObject["settings"]			
					if settings.has_key?("company_name")
						portal.setCompanyName(settings["company_name"])
					end
					if settings.has_key?("website_url")
						portal.setWebsiteURL(settings["website_url"])
					end
					if settings.has_key?("time_zone")
						portal.setTimeZone(settings["time_zone"])
					end
					if settings.has_key?("date_format")
						portal.setDateFormat(settings["date_format"])
					end
				end
					
					
				if jsonObject.has_key?("locale")
					locale = jsonObject["locale"]
					if locale.has_key?("code")
						portal.setCode(locale["code"])
					end
					if locale.has_key?("language")
						portal.setLanguage(locale["language"])
					end
					if locale.has_key?("country")
						portal.setCountry(locale["country"])
					end
				end
					
				if jsonObject.has_key?("link")
					link = jsonObject["link"]
					if link.has_key?("projects")
						project = link["project"]
						if project.has_key?("url")
							portal.setProjectURL(project["url"])
						end
					end
				end
				return portal
			end
		end
	end
end
