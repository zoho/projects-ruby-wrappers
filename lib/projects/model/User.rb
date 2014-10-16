#  $Id$ 
module Projects
	module Model
		# * This class is used to make an object for User.

		class User 

			private
				attr_accessor :id, :name, :email, :role	
			
			public

				# * Set the user id.
				# 
				# ==== Parameters
				#  
				# * id:: - ID of the user.

				def setId(id)
					@id = id
				end

				# * Get the user id.
				#
				# ==== Returns
				#  
				# * User id.
				
				def getId
					return @id
				end

				# * Set the user name.
				# 
				# ==== Parameters
				# 
				# * name:: - Name of the user.
				
				def setName(name)
					@name = name
				end

				# * Get the user name.
				#
				# ==== Returns
				#   
				# * User name.
				
				def getName
					return @name
				end

				# * Set the user email.
				# 
				# ==== Parameters
				#  
				# * email:: - Email for the user.
				
				def setEmail(email)
					@email = email
				end

				# * Get the user email.
				#
				# ==== Returns
				#   
				# * User email.
				
				def getEmail
					return @email
				end

				# * Set the user role.
				# 
				# ==== Parameters
				#  
				# * role:: - Role for the user.
				
				def setRole(role)
					@role = role
				end

				# * Get the user role.
				#
				# ==== Returns
				#   
				# * user role.
				
				def getRole
					return @role
				end
		end
	end
end