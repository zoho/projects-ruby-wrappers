#  $Id$ 
module Projects
	module Model
		# * This class is used to make an object for Owner.

		class Owner

			private
				attr_accessor :name, :id
			
			public
			
				# * Set the owner name.
				# 
				# ==== Parameters
				# 
				# * name:: - Name of the owner.

				def setName(name)
					@name = name
				end

				# * Get the owner name.
				#
				# ==== Returns
				#  
				# * Owner name.
				
				def getName
					return @name
				end

				# * Set the owner id.
				# 
				# ==== Parameters
				#  
				# * id:: - ID of the owner.
				
				def setId(id)
					@id = id
				end

				# * Get the owner id.
				#
				# ==== Returns
				# 
				# * Owner id.
				
				def getId
					return @id
				end
		end
	end
end