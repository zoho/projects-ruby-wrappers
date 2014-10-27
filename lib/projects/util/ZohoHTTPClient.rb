#  $Id$ 
module Projects
	module Util

		require "net/http"
		require "uri"
		require File.dirname(__FILE__).chomp("/projects/util") + '/projects/exception/ProjectsException'

		# * ZohoHTTPClient is used to make a HTTP request execution for GET, POST, PUT and DELETE requests.

		class ZohoHTTPClient
			include Projects::Pexception

			# * Returns the url string for making the request.
			#
			# ==== Parameters
			# 
			# * url:: - Service URL passed by the user.
			#
			# * queryMap:: - This queryMap contains the query string parameters in the form of key, value pair.
			#
			# ==== Returns
			#
			# * Url in String.

			def self.getUrl(url,queryMap)
				url = url + '?'
				i = 0
				queryMap.each do |key, value|
					if i == 0
						url = url+key+'='+String(value)
						i=i+1
					else
						url = url+'&'+key+'='+String(value)
					end
				end
				return url
			end

			# * Returns the http and uri objects for making request and response
			#
			# ==== Parameters
			#
			# * http:: - Object of NET::HTTP
			#
			# * uri:: - Object of URI which parses the url of the request

			def self.getHttpUri(url)
				uri = URI.parse(url)
				http = Net::HTTP.new(uri.host, uri.port)
				http.use_ssl = true
				http.verify_mode = OpenSSL::SSL::VERIFY_NONE
				http.open_timeout = 60
				http.read_timeout = 80
				return [http, uri]
			end

			# * Raises ProjectsException when this method is called
			#
			# ==== Parameters
			#
			# * message:: - Response message of the request

			def self.throwsException(message)
				error_json = JSON.parse message
				error_array = error_json["error"]
				raise ProjectsException.new(error_array["code"],error_array["message"])
			end

			#
			# ==== Returns
			#
			# * header for the http request

			def self.getHeader
				header = Hash.new
				header["Accept"] = "application/json"
				header["Content-Type"] = "application/x-www-form-urlencoded"
				header["Accept-Charset"] = "UTF-8"
				header["User-Agent"] = "ZohoProjects-Ruby-Wrappers/0.0.5"
				return header
			end

			# * Evaluates the response
			#
			# ==== Parameters
			#
			# * response:: - The response of the HTTP request
			#
			# * Returns response body is success or terminates the program

			def self.getResult(response)
				if response.code.to_i == 200 || response.code.to_i == 201
					return response.body
				elsif response.code.to_i == 204
					abort("No Result for the specified request")
				else
					throwsException(response.body)
				end
			end

			# * Make a GET request and fetch the response for the given URL and a query string.
			#
			# * Calls getResult to return the JSON response String.
			#
			# ==== Parameters
			#
			# * url:: - Service URL passed by the user.
			#
			# * queryMap:: - This queryMap contains the query string parameters in the form of key, value pair.
			

			def self.get(url,queryMap)
				url = getUrl(url, queryMap)
				http,uri= getHttpUri(url)
				request = Net::HTTP::Get.new(uri.request_uri, initheader = getHeader)
				response = http.request(request)
				getResult(response)
			end

			# * Make a POST request and create a resource for the given URL and a MultiPart form data.
			#
			# * Calls getResult to return the JSON response String.
			#
			# ==== Parameters
			#
			# * url:: - Service URL passed by the user.
			#
			# * queryMap:: - This queryMap contains the query string parameters in the form of key, value pair.
			#
			# * requestBody:: - This requestBody contains the form data for the POST request.
			#
			# * fileBody:: - This fileBody contains the attachment files for the POST request.

			def self.post(url, queryMap, paramMap, fileBody=nil)
				if fileBody == nil
					url = getUrl(url, queryMap)
					http,uri= getHttpUri(url)
					request = Net::HTTP::Post.new(uri.request_uri, initheader = getHeader)
					request.set_form_data(paramMap)
					response = http.request(request)
					getResult(response)
				else
					begin
						url = getUrl(url, queryMap)
						@BOUNDARY = "AaB03x"
						header = Hash.new
						header["Accept"] = "application/json"
						header["Content-Type"] = "multipart/form-data; boundary="+ @BOUNDARY
						header["Accept-Charset"] = "UTF-8"
						header["User-Agent"] = "ZohoBooks-Java-Wrappers/1.0"
						http,uri= getHttpUri(url)
						request = Net::HTTP::Post.new(uri.request_uri, initheader = header)
						post_body = []
						paramMap.each do |key, val|
							post_body << "--#{@BOUNDARY}\r\n"
							post_body << "Content-Disposition: form-data; name=\"#{key}\"\r\n\r\n#{val}\r\n"	
						end
						fileBody.each do |key, val|
							for i in 0...val.length
								post_body << "--#{@BOUNDARY}\r\n"
								post_body << "Content-Disposition: form-data; name=\"#{key}\"; filename=\"#{File.basename(val[i].path)}\"\r\n"
								post_body << "Content-Type: application/octet-stream\r\n"
								post_body << "\r\n"
								post_body << File.read(val[i].path)
								post_body << "\r\n"
							end
						end
						post_body << "--#{@BOUNDARY}--\r\n"
						request.body = post_body.join
						response = http.request(request)
						getResult(response)
					ensure 
						fileBody.each do |key, val|
							for i in 0...val.length
								if !val[i].closed?
									val[i].close
								end
							end
						end
					end
				end
			end

			# * Make a DELETE request for the given URL and a query string.
			#
			# * Calls getResult to return the JSON response String.
			#
			# ==== Parameters
			#
			# * url:: - Service URL passed by the user.
			#
			# * queryMap:: - This queryMap contains the query string parameters in the form of key, value pair.


			def self.delete(url,queryMap)
				url = getUrl(url, queryMap)
				http,uri= getHttpUri(url)
				request = Net::HTTP::Delete.new(uri.request_uri, initheader = getHeader)
				response = http.request(request)
				getResult(response)
			end
		end
	end
end
