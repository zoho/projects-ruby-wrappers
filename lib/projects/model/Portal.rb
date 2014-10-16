#  $Id$ 
module Projects
	module Model
		# * This class is used to make an object for Portal.

		class Portal
			private
			attr_accessor :id, :name, :default, :gmtTimeZone, :role, :companyName, :websiteURL, :timeZone, :dateFormat, :code, :language, :country, :projectURL

			public

				# * Set the portal id.
				# 
				# ==== Parameters
				#  
				# * id:: - ID of the portal.

				def setId(id)
					@id = id
				end

				# * Get the portal id.
				#
				# ==== Returns
				#  
				# * Portal id.
			
				def getId
					return @id
				end

				# * Set the portal name.
				# 
				# ==== Parameters
				#  
				# * name:: - Name of the portal.
			
				def setName(name)
					@name = name
				end

				# * Get the portal name.
				#
				# ==== Returns
				# 
				# * Portal name.
			
				def getName 
					return @name
				end

				# * Set whether portal is default portal or not.
				# 
				# ==== Parameters
				#  
				# * isDefault:: - Is this postal default portal or not.
			
				def setDefault(isDefault)
					@isDefault = isDefault
				end

				# * Get whether portal is default portal or not.
				#
				# ==== Returns
				#  
				# * true, if the portal is a default portal else false.
			
				def isDefault 
					return @isDefault
				end

				# * Set the gmt time zone.
				# 
				# ==== Parameters
				#  
				# * gmtTimeZone:: - Gmt time zone for the portal.

				def setGmtTimeZone(gmtTimeZone)
					@gmtTimeZone = gmtTimeZone
				end

				# * Get the gmt time zone.
				#
				# ==== Returns
				#  
				# * gmt time zone.

				def getGmtTimeZone
					return @gmtTimeZone
				end

				# * Set the role.
				# 
				# ==== Parameters
				# 
				# * role:: - Role of the person.

				def setRole(role) 
					@role = role
				end

				# * Get the role.
				#
				# ==== Returns
				# 
				# * Role of the person.

				def getRole
					return @role
				end

				# * Set the company name.
				# 
				# ==== Parameters
				#  
				# * companyName:: - Name of the company.
			
				def setCompanyName(companyName)
					@companyName = companyName
				end

				# * Get the company name.
				#
				# ==== Returns
				#  
				# * Company name.
			
				def getCompanyName
					return @companyName
				end

				# * Set the WEBsite URL.
				# 
				# ==== Parameters
				#  
				# * websiteUrl:: - URL for the Website.
			
				def setWebsiteURL(websiteUrl)
					@websiteUrl = websiteUrl
				end

				# * Get the Website URL.
				#
				# ==== Returns
				# 
				# * Website URL.

				def getWebsiteURL
					return @websiteUrl
				end

				# * Set the time zone.
				# 
				# ==== Parameters
				# 
				# * timeZone:: - Time zone for the portal.

				def setTimeZone(timeZone)
					@timeZone = timeZone
				end

				# * Get the time zone.
				#
				# ==== Returns
				#  
				# * Time zone for the portal.
			
				def getTimeZone
					return @timeZone
				end

				# * Set the date format.
				# 
				# ==== Parameters
				#  
				# * dateFormat:: - Date format for the portal.
			
				def setDateFormat(dateFormat)
					@dateFormat = dateFormat
				end

				# * Get the date format.
				#
				# ==== Returns
				#  
				# * Date format of the portal.

				def getDateFormat
					return @dateFormat
				end

				# * Set the language code.
				# 
				# ==== Parameters
				#  
				# * code:: - Code of the language.
			
				def setCode(code)
					@code =code
				end

				# * Get the language code.
				#
				# ==== Returns
				#  
				# * Language code.

				def getCode
					return @code
				end

				# * Set the language.
				# 
				# ==== Parameters
				#  
				# * language:: - Language for the portal.

				def setLanguage(language)
					@language = language
				end

				# * Get the language.
				#
				# ==== Returns
				#  
				# * Language of the portal.

				def getLanguage
					return @language
				end

				# * Set the country.
				# 
				# ==== Parameters
				#  
				# * country:: - Country for portal.

				def setCountry(country)
					@country = country
				end

				# * Get the country.
				#
				# ==== Returns
				#  
				# * Country name.
			
				def getCountry
					return @country
				end

				# * Set the project URL.
				# 
				# ==== Parameters
				#  
				# * projectUrl:: - URL for the project.
			
				def setProjectURL(projectUrl)
					@projectUrl = projectUrl
				end

				# * Get the project URL.
				#
				# ==== Returns
				#  
				# * Project URL.
			
				def getProjectURL
					return @projectUrl
				end	
		end
	end
end