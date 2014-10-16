#  $Id$ 
module Projects
	module Parser

		require 'json'
		require File.dirname(__FILE__).chomp("/projects/parser") + '/projects/model/User'

		# * Parse the JSON response into respective objects.

		class UserParser 
			include Projects::Model
			
			# * Parse the JSON response and make it into List of User object.
			#
			# ==== Parameters
			#  
			# * response:: - This JSON response contains the details of users.
			#
			# ==== Returns
			#  
			# * List of User object.

			def getUsers(response)
				users_all_json = JSON.parse response
				users_all_array = users_all_json["users"]
				users_class_array = Array.new
				for i in 0...users_all_array.length
					users_class_array.push(jsonToUser(users_all_array[i]))
				end
				return users_class_array
			end

			# * Parse the JSONObject into User object.
			#
			# ==== Parameters
			#   
			# * response:: - JSONObject contains the details of a user.
			#
			# ==== Returns
			#  
			# * User object.

			def jsonToUser(jsonObject)
				user = User.new

				if jsonObject.has_key?("id")
					user.setId(jsonObject["id"])
				end
				if jsonObject.has_key?("name")
					user.setName(jsonObject["name"])
				end
				if jsonObject.has_key?("email")
					user.setEmail(jsonObject["email"])
				end
				if jsonObject.has_key?("role")
					user.setRole(jsonObject["role"])
				end
				
				return user
			end
		end
	end
end