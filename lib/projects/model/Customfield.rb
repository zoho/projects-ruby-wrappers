# $Id$

module Projects

	module Model
	
		# * Customfield is used to make an object for projects custom field.
	
		class Customfield
	
		
			private
		
				attr_accessor :labelName, :columnName, :defaultValue, :picklistValues;
			
			
			public
			
			
				# * Set the label name of the custom field.
				#
				# ==== Parameters
				#
				# * labelName:: - Label name of the custom field.
		
				def setLabelName(labelName)
		
					@labelName = labelName
			
				end
		
				# * Get the label name of the custom field.
				#
				# ==== Returns 
				#
				# * Returns the label name.
		
				def getLabelName
			
					return @labelName
			
				end
		
				# * Set the column name of the custom field.
				#
				# ==== Parameters
				#
				# * columnName:: - Column name of the custom field.
		
				def setColumnName(columnName)
		
					@columnName = columnName
		
				end
		
				# * Get the column name of the custom field.
				#
				# ==== Returns
				#
				# Returns the column name.
		
				def getColumnName
		
					return @columnName
			
				end
		
				# * Set the default value of the custom field.
				#
				# ==== Parameters
				#
				# * defaultValue:: - Default value of the custom field.
		
				def setDefaultValue(defaultValue)
		
					@defaultValue = defaultValue
			
				end
		
				# * Get the default value of the custom field.
				#
				# ==== Returns
				#
				# * Returns the default value.
		
				def getDefaultValue
			
					return @defaultValue
			
				end
		
				# * Set the picklist values of the custom field.
				#
				# ==== Parameters
				#
				# * picklistValues:: - Picklist values of the custom field.
		
				def setPicklistValues(picklistValues)
		
					@picklistValues = picklistValues
			
				end
		
				# * Get the picklist values of the custom field.
				#
				# ==== Returns
				#
				# * Returns the picklist values
		
				def getPicklistValues
		
					return @picklistValues
			
				end
				
		end
		
	end
	
end
