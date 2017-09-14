/**
 * Feature complete Mailchimp Api 3.0 Wrapper
 *
 * see:
 * https://github.com/akitogo/mailchimpV3
 * https://www.forgebox.io/view/mailchimpV3
*/
component {

	// Module Properties
	this.title 				= "mailchimpV3";
	this.author 			= "Akitogo Internet and Media Applications GmbH";
	this.webURL 			= "https://www.akitogo.com";
	this.description 		= "Feature complete Mailchimp Api 3.0 Wrapper";
	this.version			= "1.0.0";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup 	= true;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;
	// Module Entry Point
	this.entryPoint			= "mailchimpV3";
	// Model Namespace
	this.modelNamespace		= "mailchimpV3";
	// CF Mapping
	this.cfmapping			= "mailchimpV3";
	// Auto-map models
	this.autoMapModels		= true;
	// Module Dependencies
	this.dependencies 		= [];

	function configure(){

		// parent settings
		parentSettings = {

		};

		// module settings - stored in modules.name.settings
		settings = {
			// SET YOUR MAILCHIMP API KEY
			apiKey = ''
		};

		// Layout Settings
		layoutSettings = {
			defaultLayout = ""
		};

		// datasources
		datasources = {

		};

		// SES Routes
		routes = [
			// Module Entry Point
			{ pattern="/", handler="home", action="index" },
			// Convention Route
			{ pattern="/:handler/:action?" }
		];

		// Custom Declared Points
		interceptorSettings = {
			customInterceptionPoints = ""
		};

		// Custom Declared Interceptors
		interceptors = [
		];

	}



	/**
	* Fired when the module is registered and activated.
	*/
	function onLoad(){

		// Map Google Storage Library
		binder.map( "mailchimp@mailchimpV3" )
			.to( "#moduleMapping#.models.mailchimp" )
			.initArg( name="apiKey", 			value=settings.apiKey );
	}

	/**
	* Fired when the module is unregistered and unloaded
	*/
	function onUnload(){

	}

}