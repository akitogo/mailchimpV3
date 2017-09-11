component extends="testbox.system.BaseSpec"
{


	/**
	* @hint Executes before the *set* of all tests.
	*/
	function beforeAll(){
		Automations=application.wirebox.getInstance('Automations@mailchimpv3');
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
		/* Automations															*/
		/*======================================================================*/

		describe("Automations", function(){

			//temp
			//automationID='0b43adb556';

			it("Get all Automations", function(){
				var results = Automations.getAutomations();
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'automations' );
				expect( results.automations ).toBeArray();
			});

			//we can not create an automation with API???
			//so this test we can not run

			/*it("Get a summary of an individual Automation workflow's settings and content.", function(){
				var results = Automations.getWorkflow(automationID);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'id' );
				expect( results.id ).toBe( automationID );
			});


			it("Pause all emails in an Automation workflow", function(){
				var results = Automations.pauseAllWorkflowEmails(automationID);
				expect( results ).toBeStruct();
				var automation = Automations.getWorkflow(automationID);
			    expect( automation.status ).toBe( 'paused' );
			});

			it("Start all emails in an Automation workflow", function(){
				var results = Automations.startAllWorkflowEmails(automationID);
				expect( results ).toBeStruct();
				var automation = Automations.getWorkflow(automationID);
			    expect( automation.status ).toBe( 'sending' );
			});

			it("Get a list of automated emails in a workflow", function(){
				var results = Automations.getWorkflowEmails(automationID);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'emails' );
				expect( results.emails ).toBeArray();
			});*/




		});

	}

}