component extends="testbox.system.BaseSpec"
{


	/**
	* @hint Executes before the *set* of all tests.
	*/
	function beforeAll(){
		Templates=application.wirebox.getInstance('Templates@mailchimpv3');
	}

	/**
	* @hint Executes after the *set* of all tests.
	*/
	function afterAll(){}

	/*========================================================================*/

	function run( testResults, testBox ){

		/*
		* @hint: Executes before each and every test.
		*/
		beforeEach(function( currentSpec ) {
		});

		/*
		* @hint: Executes after each and every test.
		*/
		afterEach(function( currentSpec ) {
			// do something
		});

		/*======================================================================*/
		/* Templates														    */
		/*======================================================================*/

		describe("Templates", function(){


			// get all Templates
			it("Get all Templates", function(){
				var results = Templates.getTemplates();
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'templates' );
				expect( results.templates ).toBeArray();
				expect( arrayLen(results.templates) ).toBeGT(0);
			});

			// create a new empty Template, no html
			it("Create a Template 1", function(){
				var results = Templates.createTemplate(
					name='testTemplate_#minute(now())##second(now())#'
					,html='<body></body>'
					);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'id' );
				templateId1=results.id;//will be deleted in the end of test
			});


	        // create a basic 1 column template, from a html file

			it("Create a Template 2", function(){
				var template1 = fileread('./basic1columnTemplate.html');
				var results = Templates.createTemplate(name='testTemplate_#minute(now())##second(now())#', html=template1);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'id' );
				expect( results ).toHaveKey( 'type' );
				expect( results.type ).toBe( 'user' );
				templateId2=results.id;//will be deleted in the end of test
			});

			//get Template
			it("Get a Template", function(){
				var results = Templates.getTemplate(templateId2);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'id' );
				expect( results.id ).toBe(templateId2);
				expect( results ).toHaveKey( 'drag_and_drop' );
				expect( results.drag_and_drop ).toBe(false);
			});

			//edit Template
			it("Edit Template", function(){
				var template2 = fileread('./basic2columnsTemplate.html');
				var newName = 'testTemplateNewName_#minute(now())##second(now())#';
				var results = Templates.editTemplate(template_id=templateId2, name=newName, html=template2);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'id' );
				expect( results.id ).toBe(templateId2);
				expect( results ).toHaveKey( 'name' );
				expect( results.name ).toBe(newName);
			});

			//get Template Content
			it("Get Template Content", function(){
				var results = Templates.getTemplateContent(template_id=templateId2);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'sections' );
				expect( results.sections ).toBeStruct();
			});

			// delete created Templates
			it("Delete created Templates", function(){
				var results1 = Templates.deleteTemplate(templateId1);
				expect( results1 ).toBeStruct();
				expect( results1 ).toBeEmpty();
				var results2 = Templates.deleteTemplate(templateId2);
				expect( results2 ).toBeStruct();
				expect( results2 ).toBeEmpty();
			});




		});

	}

}