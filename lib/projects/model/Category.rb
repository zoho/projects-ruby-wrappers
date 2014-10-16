#  $Id$ 
module Projects
	module Model
		# * This class is used to make an object for Category.

		class Category 

			private
				attr_accessor :id, :name
			
			public
			
				# * Set the category id.
				# 
				# ==== Parameters
				#  
				# * id:: - ID of the category.

				def setId(id)
					@id = id
				end

				# * Get the category id.
				#
				# ==== Returns
				#   
				# * Category id.
				
				def getId
					return @id
				end

				# * Set the category name.
				# 
				# ==== Parameters
				#  
				# * name:: - Name of the category.
				
				def setName(name)
					@name = name
				end

				# * Get the category name.
				#
				# ==== Returns
				#   
				# * Category name.
				
				def getName
					return @name
				end

				# * Convert the Category object into HashMap object.
				#
				# ==== Returns
				#  
				# * HashMap object.
				
				def toParamMAP
					requestBody = Hash.new
					
					if name != nil
						requestBody["name"] = name
					end

					return requestBody
				end
		end
	end
end