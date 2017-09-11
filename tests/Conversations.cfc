component extends="testbox.system.BaseSpec"
{


	/**
	* @hint Executes before the *set* of all tests.
	*/
	function beforeAll(){
		conversations=application.wirebox.getInstance('conversations@mailchimpv3');
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
		/* Conversations																*/
		/*======================================================================*/

		describe("Conversations", function(){

			it("Get a list of conversations for the account.", function(){
				results = conversations.getConversations();
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'conversations' );
				expect( results.conversations ).toBeArray();
			});

			// other methods we can not test with automatic tests because
			// we can not create an conversation from API

		});



	}

}