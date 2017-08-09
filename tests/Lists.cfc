component extends="testbox.system.BaseSpec" 
{
	
	
	/**
	* @hint Executes before the *set* of all tests.
	*/
	function beforeAll(){
		lists=application.wirebox.getInstance('lists@mailchimpv3');
		listsInterestCategories=application.wirebox.getInstance('listsInterestCategories@mailchimpv3');
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
		/* Lists																*/
		/*======================================================================*/

		describe("Lists", function(){

			// get all lists
			it("Get Api results", function(){
				var results = lists.getLists();
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'lists' );
			});

			// create list
			it("Create a test list", function(){
				newList = lists.addList(
				  	name = 'TEST LIST TO BE DELETED'
				  	,contact = {
				  		"company": "Company",
						"address1": "address 1",
						"address2": "address 2",
						"city": "city",
						"state": "state",
						"zip": "zip",
						"country": "country",
						"phone": "+49000000000"
				  	}
				  	,permission_reminder = 'This is the permission reminder'
				  	,use_archive_bar = FALSE
				  	,campaign_defaults ={
						"from_name": "From Test",
						"from_email": "test@test.com",
						"subject": "This is the subject",
						"language": "DE"  		
				  	}
				  	,notify_on_subscribe = 'subscribe@test.com'
				  	,notify_on_unsubscribe = 'unsubscribe@test.com'
				  	,email_type_option = FALSE
				  	,visibility = 'pub'
 				);
  	
				expect( newList ).toBeStruct();
				expect( newList ).toHaveKey( 'id' );
			});
			

			// batch add members to list
			it("Batch add members, be aware that subscribers may not show up immediately", function(){
				var results = lists.batchListMembers(
					list_id = newList.id
					,members =[
						{
						"email_address": "test_#minute(now())##second(now())#@test.com",
						"email_type": "html",
						"status":"subscribed"
						},
						{
						"email_address": "test_2#minute(now())##second(now())#@test.com",
						"email_type": "html",
						"status":"subscribed"
						}						
					]
					,update_existing = true			
				);	
				expect( results ).toBeStruct();
				expect( results.new_members ).toBeArray( );
				expect( arrayLen(results.new_members )).toBe( 2 );
			});			

		});
		/*======================================================================*/
		/* List categories														*/
		/*======================================================================*/
		describe("Lists Interest Categories", function(){

			// Adds an interest Category
			it("Adds an interest Category to the test list", function(){
				InterestCategories = listsInterestCategories.addInterestCategories(
				  	list_id = newList.id
				  	,title= 'Test Category Title'
				  	,display_order = 0
				  	,type= 'checkboxes'
 				);
				expect( InterestCategories ).toBeStruct();
				expect( InterestCategories ).toHaveKey( 'id' );
			});
			

	
		});		

		/*======================================================================*/
		/* Delete test list														*/
		/*======================================================================*/		
		describe("Lists - final clean up", function(){

			// deletes the test list
			it("We are done, deleting test list", function(){
				var results = lists.deleteList(list_id = newList.id);
				expect( results ).toBeStruct();
			});			
		});		
		/*====================================================================*/
	
	}

}