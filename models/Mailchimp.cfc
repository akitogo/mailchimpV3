
component displayname="MailChimp" accessors="true"  {
	property name="apiHost";
	property name="apiKey";
	
	variables.apiHost = "https://us1.api.mailchimp.com/3.0/";
	variables.apiKey = "";
	variables.debug = false;

	public mailchimp function init (
			 string apiKey = "",
				 string apiHost = ""
	) {
			
		if (len(arguments.apiKey) > 0) {
			variables.apiKey = arguments.apiKey;

			// Allow apiHost to be set manually
			if (len(arguments.apiHost) > 0) {
				variables.apiHost = arguments.apiHost;

			// Get datacenter from API key
			} else {
				var dc = listLast(variables.apiKey, "-");
				variables.apiHost = replace(variables.apiHost, "us1", dc);
			}


		} else {
			throw(message="Mailchimp apiKey was not set");
		}


		return this;
	}


	public struct function mailchimpRequest (
		required string requestMethod,
		required string endpoint,
				 any params = {}
	) {
		// we need to duplicate since structs are by reference
		var allParams=duplicate(arguments.params);
		
		
		// checks if path has elements to be replaced
		var urlAsArray = listToArray(arguments.endpoint,'/');
		for(var singleSegment in urlAsArray){
			if(left(singleSegment,1) eq '{'){
				toBeReplacedWith=allparams[mid(singleSegment,2,len(singleSegment)-2)];
				arguments.endpoint=replace(endpoint,singleSegment,toBeReplacedWith);
				
				structDelete(arguments,toBeReplacedWith);
			}
		}

		if(requestMethod eq 'post' or requestMethod eq 'delete'	){
			local.url = variables.apiHost & arguments.endpoint;
		} else {
			local.url = variables.apiHost & arguments.endpoint & structToQueryString(allparams);
		}
					


		var httpService = new http(url=local.url, method=requestMethod);
		httpService.addParam(type="header",name="Authorization", value="apikey #getApiKey()#");
		
		if(requestMethod eq 'post'){
			httpService.addParam(type="body", value=serializeJson(allparams));
		}

		var httpresponse = httpService.send().getPrefix();
		var httpContent = httpresponse.fileContent;
		
		// for successful delete oeprations we do not receive any content
		if(requestMethod eq 'delete'){
			if (httpresponse.status_code gte 200 and httpresponse.status_code lt 300)
				return {};
		}
		responseJson = variables.parseJson(httpContent);

		return responseJson;
	}


	// Performs a MailChimp's HTTP POST batch operation
	private function batch (
		required array operations
	) {
		local.url = variables.apiHost & "batches";
		data = { operations = arguments.operations };

		if (variables.debug) {
			writeOutput("HTTP POST: " & local.url & "<br>");
			writeDump(variables.serializeJson(arguments.data));
		}

		httpService = new http(url=local.url, method="post");
		httpService.addParam(type="header",name="Authorization", value="apikey #getApiKey()#");

		httpService.addParam(type="body", value=variables.serializeJson(data));
		httpService = httpService.send();

		if (variables.debug) { writeDump(httpService); }

		httpContent = httpService.getPrefix().fileContent;
		responseJson = variables.parseJson(httpContent);

		return responseJson;
	}

	// If JSONUtil is defined, use it to serialize an object to JSON, otherwise fall back to CF's serializer
	private string function serializeJson (
		required data
	) {
		if (structKeyExists(variables, "JSONUtil")) {
			return variables.JSONUtil.serialize(var=arguments.data);
		} else {
			return serializeJson(arguments.data);
		}
	}

	// If JSONUtil is defined, use it to parse JSON string into an object, otherwise fall back to CF's deserializer
	private function parseJson (
		required string json
	) {
		if (structKeyExists(variables, "JSONUtil")) {
			return variables.JSONUtil.deserializeJSON(arguments.json);
		} else {
			return deserializeJson(arguments.json);
		}
	}

	// Converts a struct into a URL query string
	private string function structToQueryString (
		required struct params
	) {
		response = "";

		// Adds default exclude_fields=_links. This drastically reduces the response size from MailChimp
		if (!(structKeyExists(arguments.params, "exclude_fields") || structKeyExists(arguments.params, "fields"))) {
			arguments.params.exclude_fields = "_links";
		}

		for (key in arguments.params) {
			response = listAppend(response, key & "=" & urlEncodedFormat(arguments.params[key]), "&");
		}

		if (len(response) > 0) {
			response = "?" & response;
		}

		return response;
	}

	// In the event of an HTTP error status, parses the detail out of the CF HTTP object
	private string function getErrorFromHttp (
		required struct http
	) {
		return {
			"statusCode" = arguments.http.statusCode,
			"errorDetail" = arguments.http.errorDetail
		};
	}
}
