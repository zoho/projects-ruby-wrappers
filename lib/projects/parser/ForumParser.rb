#  $Id$ 
module Projects
	module Parser

		require 'json'
		require File.dirname(__FILE__).chomp("/projects/parser") + '/projects/model/Forum'
		require File.dirname(__FILE__).chomp("/projects/parser") + '/projects/model/Category'
		require File.dirname(__FILE__).chomp("/projects/parser") + '/projects/model/Comment'

		#* Parse the JSON response into respective objects.

		class ForumParser
			include Projects::Model
			# * Parse the JSON response and make it into List of Forum object.
			#
			# ==== Parameters
			#   
			# * response:: - This JSON response contains the details fo forums.
			#
			# ==== Returns
			#  
			# * List of Forum object.
			
			def getForums(response)
				forums_all_json = JSON.parse response
				forums_all_array = forums_all_json["forums"]
				forums_class_array = Array.new
				for i in 0...forums_all_array.length
					forums_class_array.push(jsonToForum(forums_all_array[i]))
				end
				return forums_class_array
			end

			# * Parse the JSON response and make it into Forum object.
			#
			# ==== Parameters
			#  
			# * response:: - This JSON response contains the details of a forum.
			#
			# ==== Returns
			#   
			# * Forum object.

			def getForum(response)
				forum_json = JSON.parse response
				forum_array = forum_json["forums"]
				return jsonToForum(forum_array[0])
			end

			# * Parse the JSONObject into Forum object.
			#
			# ==== Parameters
			#   
			# * jsonObject:: - JSONObject contains the details of a forum.
			#
			# ==== Returns
			#   
			# * Forum object.
			
			def jsonToForum(jsonObject)
				forum = Forum.new
				
				if jsonObject.has_key?("id")	
					forum.setId(jsonObject["id"])
				end
				if jsonObject.has_key?("name")
					forum.setName(jsonObject["name"])
				end
				if jsonObject.has_key?("content")
					forum.setContent(jsonObject["content"])
				end
				if jsonObject.has_key?("is_sticky_post")
					forum.setIsStickyPost(jsonObject["is_sticky_post"])
				end
				if jsonObject.has_key?("is_announcement_post")
					forum.setIsAnnouncementPost(jsonObject["is_announcement_post"])
				end
				if jsonObject.has_key?("posted_by")
					forum.setPostedBy(jsonObject["posted_by"])
				end
				if jsonObject.has_key?("posted_person")
					forum.setPostedPerson(jsonObject["posted_person"])
				end
				if jsonObject.has_key?("post_date")
					forum.setPostDate(jsonObject["post_date"])
				end
				if jsonObject.has_key?("post_date_format")
					forum.setPostDateFormat(jsonObject["post_date_format"])
				end
				if jsonObject.has_key?("post_date_long")
					forum.setPostDateLong(jsonObject["post_date_long"])
				end
				
				if jsonObject.has_key?("link")
					link = jsonObject["link"]
					
					if link.has_key?("self")
						forum.setURL(link["self"]["url"])
					end
				end
				
				return forum
			end

			# * Parse the JSON response and get the success message.
			#
			# ==== Parameters
			#   
			# * response:: - This JSON response contains the success message.
			#
			# ==== Returns
			#  
			# * String object.
			
			def getResult(response)
				jsonObject = JSON.parse response
				result = jsonObject["response"]
				return result
			end
			
			# * Parse the JSON response and make it into List of Category object.
			#
			# ==== Parameters
			#  
			# * response:: - This JSON response contains the details of categories.
			#
			# ==== Returns
			#  
			# * List of Category object.

			def getCategories(response)
				categories_all_json = JSON.parse response
				categories_all_array = categories_all_json["categories"]
				categories_class_array = Array.new
				for i in 0...categories_all_array.length
					categories_class_array.push(jsonToCategory(categories_all_array[i]))
				end
				return categories_class_array
			end

			# * Parse the JSON response and make it into Category object.
			#
			# ==== Parameters
			#  
			# * response:: - This JSON response contains the details of a category.
			#
			# ==== Returns
			#  
			# * Category object.

			def getCategory(response)
				category_json = JSON.parse response
				category_array = category_json["categories"]
				return jsonToCategory(category_array[0])
			end

			# * Parse the JSONObject into Category object.
			#  
			# * jsonObject:: - JSONObject contains the details of a category.
			#
			# ==== Returns
			#   
			# * Category object.

			def jsonToCategory(jsonObject)
				category = Category.new
				
				if jsonObject.has_key?("id")
					category.setId(jsonObject["id"])
				end
				if jsonObject.has_key?("name")
					category.setName(jsonObject["name"])
				end
				
				return category
			end
			
			# * Parse the JSON response and make it into List of Comment object.
			#
			# ==== Parameters
			#   
			# * response:: - This JSON response contains the details of comments.
			#
			# ==== Returns
			#  
			# * List of Comment object.	
			
			def getComments(response)
				comments_all_json = JSON.parse response
				comments_all_array = comments_all_json["comments"]
				comments_class_array = Array.new
				for i in 0...comments_all_array.length
					comments_class_array.push(jsonToComment(comments_all_array[i]))
				end
				return comments_class_array
			end

			# * Parse the JSON response and make it into Comment object.
			#
			# ==== Parameters
			#  
			# * response:: - This JSON response contains the details of a comment.
			#
			# ==== Returns
			#   
			# * Comment object.
			
			def getComment(response)
				comment_json = JSON.parse response
				comment_array = comment_json["comments"]
				return jsonToComment(comment_array[0])
			end

			# * Parse the JSONObject into Comment object.
			#
			# ==== Parameters
			#   
			# * jsonObject:: - JSONObject contains the details of a comment.
			#
			# ==== Returns
			#  
			# * Comment object.

			def jsonToComment(jsonObject)
				comment = Comment.new
				
				if jsonObject.has_key?("id")
					comment.setId(jsonObject["id"])
				end
				if jsonObject.has_key?("content")
					comment.setContent(jsonObject["content"])
				end
				if jsonObject.has_key?("posted_by")
					comment.setPostedBy(jsonObject["posted_by"])
				end
				if jsonObject.has_key?("posted_person")
					comment.setPostedPerson(jsonObject["posted_person"])
				end
				if jsonObject.has_key?("post_date")
					comment.setPostDate(jsonObject["post_date"])
				end
				if jsonObject.has_key?("post_date_format")
					comment.setPostDateFormat(jsonObject["post_date_format"])
				end
				if jsonObject.has_key?("post_date_long")
					comment.setPostDateLong(jsonObject["post_date_long"])
				end
				
				return comment
			end
		end
	end
end