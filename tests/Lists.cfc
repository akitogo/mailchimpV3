component extends="testbox.system.BaseSpec"
{


	/**
	* @hint Executes before the *set* of all tests.
	*/
	function beforeAll(){
		lists=application.wirebox.getInstance('lists@mailchimpv3');
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

			// create a list
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
						"from_email": "test@test.com",   //not good email
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
				listID = newList.id;

				expect( newList ).toHaveKey( 'name' );
				expect( newList.name ).toBe( 'TEST LIST TO BE DELETED' );
			});

			// get all lists
			it("Get all lists", function(){
				var results = lists.getLists();
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'lists' );
				expect( results.lists ).toBeArray();
				expect( arrayLen(results.lists) ).toBeGT(0);
			});



			// get a list
			it("Get a created list", function(){
				var results = lists.getList(listID);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'id' );
				expect( results.id ).toBe( listID );
			});



			// update a list
			it("Update the name of a test list", function(){
				name_updated = 'TEST LIST TO BE DELETED UPDATED';
				newList2 = lists.editList(
				    list_id = listID
				  	,name = name_updated
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

				expect( newList2 ).toBeStruct();
				expect( newList2 ).toHaveKey( 'id' );
				expect( newList2.id ).toBe( listID ); // should be same id
				expect( newList2 ).toHaveKey( 'name' );
				expect( newList2.name ).toBe( name_updated );
			});


			// batch add members to list
			it("Batch add members, be aware that subscribers may not show up immediately", function(){
				//global email use later in search test
				email1 = 'test_#minute(now())##second(now())#@test.com';
				var results = lists.batchListMembers(
					list_id = listID
					,members =[
						{
						"email_address": email1,
						"email_type": "html",
						"status":"subscribed",
						"merge_fields": {},
						"interests": {},
						"language": "DE",
						"vip": false,
						"location": {"latitude":0,"longitude":0},
						"ip_signup":"",
						"timestamp_signup": "",
						"ip_opt":"",
						"timestamp_opt":""
						},
						{
						"email_address": "test_2#minute(now())##second(now())#@test.com",
						"email_type": "html",
						"status":"subscribed",
						"merge_fields": {},
						"interests": {},
						"language": "DE",
						"vip": false,
						"location": {"latitude":0,"longitude":0},
						"ip_signup":"",
						"timestamp_signup": "",
						"ip_opt":"",
						"timestamp_opt":""
						}
					]
					,update_existing = false
				);

				expect( results ).toBeStruct();
				expect( results.new_members ).toBeArray( );
				expect( arrayLen(results.new_members )).toBe( 2 );
			});


		});


		// abuse reports

		describe("Get all Abuse Reports", function(){

			it("Gets all abuse reports from a list", function(){
				AbuseReports = lists.getAbuseReports(list_id = listID);
				expect( AbuseReports ).toBeStruct();
				expect( AbuseReports ).toHaveKey( 'abuse_reports' );
				expect( AbuseReports ).toHaveKey( 'total_items' );
			});

			// Get details about a specific abuse report.
			// An abuse complaint occurs when your recipient reports an email as spam in their mail program.
			// Difficult to write an automated test

		});


		// list activity

		describe("Get recent list activity", function(){

			it("Gets recent list activity", function(){
				listActivity = lists.getActivity(list_id = listID);
				expect( listActivity ).toBeStruct();
				expect( listActivity ).toHaveKey( 'activity' );
				expect( listActivity.activity ).toBeArray();
			});

		});


		// email clients

		describe("Get information about the most popular email clients in a list", function(){

			it("Get information about email clients", function(){
				var clients = lists.getClients(list_id = listID);
				expect( clients ).toBeStruct();
				expect( clients ).toHaveKey( 'clients' );
				expect( clients.clients ).toBeArray();
			});

		});



		// Growth History

		describe("Get list growth history data", function(){

			it("Get a month-by-month summary of a specific list’s growth activity.", function(){
				GrowthHistory = lists.getGrowthHistory(list_id = listID);
				expect( GrowthHistory ).toBeStruct();
				expect( GrowthHistory ).toHaveKey( 'history' );
				expect( GrowthHistory.history ).toBeArray();
			});

			it("Get a summary of a specific list’s growth activity for a specific month and year.", function(){

				monthNow = dateFormat(now(), "yyyy-mm");
				GrowthHistoryByMonth = lists.getGrowthHistoryByMonth(list_id = listID, month=monthNow);
				expect( GrowthHistory ).toBeStruct();
			});

		});


		// Interest Categories

		describe("Interest Categories Methods", function(){

			it("Create a new interest category for a list", function(){
				interestCategoryName = 'interestCategory_#minute(now())##second(now())#';
				interestCategory = lists.addInterestCategory(list_id = listID, title=interestCategoryName, type='checkboxes');
				expect( interestCategory ).toBeStruct();
				expect( interestCategory ).toHaveKey( 'title' );
				expect( interestCategory ).toHaveKey( 'id' );
				interestCategoryID = interestCategory.id;
				expect( interestCategory.title ).toBe(interestCategoryName);
			});

			it("Get information about a list's interest categories", function(){
				interestCategories = lists.getInterestCategories(list_id = listID);
				expect( interestCategories ).toBeStruct();
				expect( interestCategories ).toHaveKey( 'categories' );
				expect( interestCategories.categories ).toBeArray();
			});

			it("Get information about a specific interest category from the list", function(){
				interestCategory = lists.getInterestCategory(list_id=listID, interest_category_id=interestCategoryID);
				expect( interestCategory ).toBeStruct();
				expect( interestCategory ).toHaveKey( 'id' );
				expect( interestCategory.id ).toBe( interestCategoryID );
				expect( interestCategory ).toHaveKey( 'title' );
				expect( interestCategory.title ).toBe( interestCategoryName );
			});

			it("Update a specific interest category from the list", function(){
				newInterestCategoryName = 'newName_#minute(now())##second(now())#';
				interestCategoryToUpdate = lists.updateInterestCategory(list_id=listID, interest_category_id=interestCategoryID, title=newInterestCategoryName, type='radio');
				expect( interestCategoryToUpdate ).toBeStruct();
				expect( interestCategoryToUpdate ).toHaveKey( 'id' );
				expect( interestCategoryToUpdate.id ).toBe( interestCategoryID );
				expect( interestCategoryToUpdate ).toHaveKey( 'title' );
				expect( interestCategoryToUpdate.title ).toBe( newInterestCategoryName );
				expect( interestCategoryToUpdate ).toHaveKey( 'type' );
				expect( interestCategoryToUpdate.type ).toBe( 'radio' );
			});

			//We are testing "Delete Interests Category" in the end

		});


		// Interest Categories -> Interests

		describe("Interest Categories Methods", function(){

			it("Create a new interest in a specific interests category", function(){
				interestName = 'interest_#minute(now())##second(now())#';
				interest = lists.addInterestToInterestsCategory(list_id = listID, interest_category_id=interestCategoryID, name=interestName);
				expect( interest ).toBeStruct();
				expect( interest ).toHaveKey( 'name' );
				expect( interest.name ).toBe( interestName );
				expect( interest ).toHaveKey( 'id' );
				interestId = interest.id;
			});

			it("Get all interests in a specific interests category", function(){
				interests = lists.getAllInterestsInInterestsCategory(list_id = listID, interest_category_id=interestCategoryID);
				expect( interests ).toBeStruct();
				expect( interests ).toHaveKey( 'interests' );
				expect( interests.interests ).toBeArray();
			});

			it("Get an interest in a specific interests category", function(){
				interest = lists.getInterestInInterestsCategory(list_id = listID, interest_category_id=interestCategoryID, interest_id= interestID);
				expect( interest ).toBeStruct();
				expect( interest ).toHaveKey( 'id' );
				expect( interest.id ).toBe(interestID);
			});

			it("Update interest in a specific interests category", function(){
				newInterestName = 'new_interest_name_#minute(now())##second(now())#';
				updatedInterest = lists.updateInterestInInterestsCategory(list_id = listID, interest_category_id=interestCategoryID, interest_id= interestID, name=newInterestName);
				expect( updatedInterest ).toBeStruct();
				expect( updatedInterest ).toHaveKey( 'id' );
				expect( updatedInterest.id ).toBe(interestID);
			});

			it("Delete interest in a specific interests category", function(){
				var results = lists.deleteInterestInInterestsCategory(list_id = listID, interest_category_id=interestCategoryID, interest_id= interestID);
				expect( results ).toBeStruct();
				expect( results ).toBeEmpty();
			});

		});


		describe("Lists - Locations", function(){

			it("Get list locations", function(){
				var results = lists.getLocations(list_id = listID);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'locations' );
				expect( results.locations ).toBeArray();
			});

		});


		describe("Lists - Members", function(){

			it("Get all members", function(){
				var members = lists.getMembers(list_id = listID);
				expect( members ).toBeStruct();
				expect( members ).toHaveKey( 'members' );
				expect( members.members ).toBeArray();
			});

			it("Add a member", function(){
				newEmailToAdd = 'test_#minute(now())##second(now())#@test.com';
				var result = lists.addMember(list_id = listID, email_address=newEmailToAdd, status='subscribed');
				expect( result ).toBeStruct();
				expect( result ).toHaveKey( 'email_address' );
				expect( result.email_address ).toBe( newEmailToAdd );
			});

			it("Get information about a specific list member", function(){
				var result = lists.getMemberInfo(list_id = listID, email=newEmailToAdd);
				expect( result ).toBeStruct();
				expect( result ).toHaveKey( 'email_address' );
				expect( result.email_address ).toBe( newEmailToAdd );
			});

			it("Update member", function(){
				newUpdatedEmail = 'new_test_#minute(now())##second(now())#@test.com';
				var result = lists.updateMember(list_id = listID, email=newEmailToAdd, email_address=newUpdatedEmail);
				expect( result ).toBeStruct();
				expect( result ).toHaveKey( 'email_address' );
				expect( result.email_address ).toBe( newUpdatedEmail );
			});

			it("Add or update member", function(){
				newEmailToAdd2 = 'new_test_2_#minute(now())##second(now())#@test.com';
				var result = lists.addOrUpdateMember(list_id = listID, email=newEmailToAdd2, email_address=newEmailToAdd2, status_if_new='subscribed');
				expect( result ).toBeStruct();
				expect( result ).toHaveKey( 'email_address' );
				expect( result.email_address ).toBe( newEmailToAdd2 );
			});

			//test remove member later

			it("Get Member activity", function(){
				var result = lists.getMemberActivity(list_id=listID, email=newUpdatedEmail);
				expect( result ).toBeStruct();
				expect( result ).toHaveKey( 'activity' );
				expect( result.activity ).toBeArray();
			});

			it("Get Member goals", function(){
				var result = lists.getMemberGoals(list_id=listID, email=newUpdatedEmail);
				expect( result ).toBeStruct();
				expect( result ).toHaveKey( 'goals' );
				expect( result.goals ).toBeArray();
			});

			it("Add Member note", function(){
				//writedump(newUpdatedEmail);//remove later
				var result = lists.addMemberNote(list_id=listID, email=newUpdatedEmail, note='Lorem Ipsum');
				expect( result ).toBeStruct();
				expect( result ).toHaveKey( 'note' );
				expect( result.note ).toBe('Lorem Ipsum');
				noteId = result.id;
			});

			it("Get Member notes", function(){
				var result = lists.getMemberNotes(list_id=listID, email=newUpdatedEmail);
				expect( result ).toBeStruct();
				expect( result ).toHaveKey('notes');
				expect( result.notes ).toBeArray();
			});

			it("Get Member note", function(){
				var result = lists.getMemberNote(list_id=listID, email=newUpdatedEmail, note_id=noteId);
				expect( result ).toBeStruct();
				expect( result ).toHaveKey('id');
				expect( result.id ).toBe( noteId );
			});

			it("Edit Member note", function(){
				var result = lists.editMemberNote(list_id=listID, email=newUpdatedEmail, note_id=noteId, note='Lorem 2');
				expect( result ).toBeStruct();
				expect( result ).toHaveKey('id');
				expect( result.id ).toBe( noteId );
				expect( result.note ).toBe( 'Lorem 2' );
			});

			it("Delete Member note", function(){
				var result = lists.deleteMemberNote(list_id=listID, email=newUpdatedEmail, note_id=noteId);
				expect( result ).toBeStruct();
				expect( result ).toBeEmpty();
			});

		});




		describe("Lists - Merge Fields", function(){

			it("Add merge field to a list", function(){
				mergeFieldName='merge_field_#minute(now())##second(now())#';
				var results = lists.addMergeField(list_id = listID, name=mergeFieldName, type='text');
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'name' );
				expect( results.name ).toBe( mergeFieldName );
				mergeID = results.merge_id;
			});

			it("Get merge fields for a list", function(){
				var results = lists.getMergeFields(list_id = listID);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'merge_fields' );
				expect( results.merge_fields ).toBeArray();
			});

			it("Get a merge field", function(){
				var results = lists.getMergeField(list_id = listID, merge_id=mergeID);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'name' );
				expect( results.name ).toBe( mergeFieldName );
				expect( results ).toHaveKey( 'merge_id' );
				expect( results.merge_id ).toBe( mergeID );
			});

			it("Update a merge field", function(){
				mergeFieldName2='merge_field_2_#minute(now())##second(now())#';
				var results = lists.editMergeField(list_id = listID, merge_id=mergeID, name=mergeFieldName2);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'name' );
				expect( results.name ).toBe( mergeFieldName2 );
				expect( results ).toHaveKey( 'merge_id' );
				expect( results.merge_id ).toBe( mergeID );
			});

			it("Delete a merge field", function(){
				var results = lists.deleteMergeField(list_id = listID, merge_id=mergeID);
				expect( results ).toBeStruct();
				expect( results ).toBeEmpty();
			});

		});



		describe("Lists - Segments", function(){

			it("Get information about all available segments for a specific list.", function(){
				var results = lists.getSegments(list_id = listID);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey('segments');
				expect( results.segments ).toBeArray();
			});

			it("Add a segment for a specific list.", function(){
				segmentName='segment_name_#minute(now())##second(now())#';
				var results = lists.addSegment(list_id = listID, name=segmentName, static_segment=[] );
				expect( results ).toBeStruct();
				expect( results ).toHaveKey('name');
				expect( results.name ).toBe( segmentName );
				segmentID = results.id;
			});

			it("Get information about a specific segment.", function(){
				var results = lists.getSegment(list_id = listID, segment_id = segmentID);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey('id');
				expect( results.id ).toBe( segmentID );
			});

			it("Batch add/remove list members to static segment", function(){



				var results = lists.addOrRemoveSegmentMembers(list_id = listID, segment_id = segmentID, members_to_add=[], members_to_remove=[] );
				expect( results ).toBeStruct();
				expect( results ).toHaveKey('members_added');
			});

			it("Update a specific segment.", function(){
				segmentName2='segment_name_2_#minute(now())##second(now())#';
				var results = lists.updateSegment(list_id = listID, segment_id = segmentID, name=segmentName2, static_segment=[]);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey('name');
				expect( results.name ).toBe( segmentName2 );
			});

			it("Delete a specific segment in a list.", function(){
				var results = lists.deleteSegment(list_id = listID, segment_id = segmentID);
				expect( results ).toBeStruct();
				expect( results ).toBeEmpty();
			});

		});



		describe("Lists - Segment Members", function(){

			it("Add a member to a static segment.", function(){
				//create a segment
				segmentNewOne='Segment_New_One_#minute(now())##second(now())#';
				var results = lists.addSegment(list_id = listID, name=segmentNewOne, static_segment=[] );
				newSegmentId = results.id;
				//create a member
				emailToAdd = 'test_#minute(now())##second(now())#@test.com';
				var result = lists.addMember(list_id = listID, email_address=emailToAdd, status='subscribed');

				var results = lists.addSegmentMember(list_id = listID, segment_id = newSegmentId, email_address=emailToAdd);

				expect( results ).toBeStruct();
				expect( results ).toHaveKey('email_address');
				expect( results.email_address ).toBe( emailToAdd );
			});

			it("Get information about members in a saved segment.", function(){
				var results = lists.getSegmentMembers(list_id = listID, segment_id = newSegmentId);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey('members');
				expect( results.members ).toBeArray();
			});

			it("Remove a member from the specified static segment.", function(){
				var results = lists.removeSegmentMember(list_id = listID, segment_id = newSegmentId, email=emailToAdd );
				expect( results ).toBeStruct();
				expect( results ).toBeEmpty();
			});

		});


		describe("Lists - Signup Forms", function(){

			it("Get signup forms for a specific list.", function(){
				var results = lists.getSignupForms(list_id = listID );
				expect( results ).toBeStruct();
				expect( results ).toHaveKey('signup_forms');
				expect( results.signup_forms ).toBeArray();
			});

			it("Customize a list’s default signup form.", function(){
				//TODO
				//var results = lists.editSignupForm(list_id = listID);
				//writedump(results);abort;
			});

		});



		describe("Search Members", function(){

			it("Search for list members.", function(){
				var results = lists.searchMembers(query=email1, list_id=listID);
				expect( results ).toBeStruct();
				expect( results ).toHavekey( 'exact_matches' );
				expect( results.exact_matches ).toBeStruct();
				expect( results.exact_matches.members[1].email_address ).toBe( email1 );
			});
		});






		describe("Lists - Webhooks", function(){

			it("Get information about all webhooks for a specific list.", function(){
				var results = lists.getWebhooks(list_id = listID );
				expect( results ).toBeStruct();
				expect( results ).toHaveKey('webhooks');
				expect( results.webhooks ).toBeArray();
			});

			it("Create a new webhook for a specific list.", function(){
				url_link='http://www.test.com';
				var results = lists.addWebhook(list_id = listID, url=url_link );
				expect( results ).toBeStruct();
				expect( results ).toHaveKey('id');
				webhookID = results.id;
				expect( results.url ).toBe( url_link );
			});

			it("Get information about a specific webhook.", function(){
				var results = lists.getWebhook(list_id = listID, webhook_id=webhookID);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey('id');
				expect( results.id ).toBe( webhookID );
			});

			it("Delete a specific webhook in a list.", function(){
				var results = lists.deleteWebhook(list_id = listID, webhook_id=webhookID);
				expect( results ).toBeStruct();
				expect( results ).toBeEmpty();
			});


		});




		/*======================================================================*/
		/* Delete test list														*/
		/*======================================================================*/
		/*====================================================================*/
		describe("Lists - final clean up", function(){
			it("Remove member", function(){
				var result = lists.deleteMember( list_id = listID, email=newEmailToAdd2 );
				expect( result ).toBeStruct();
				expect( result ).toBeEmpty();
			});

			it("Delete a specific interest category", function(){
				results = lists.deleteInterestCategory(list_id=listID, interest_category_id=interestCategoryID);
				expect( results ).toBeStruct();
				expect( results ).toBeEmpty();
			});

			// deletes the test list
			it("We are done, deleting test list", function(){
				var results = lists.deleteList(list_id = newList.id);
				expect( results ).toBeStruct();
				expect( results ).toBeEmpty();
			});
		});


	}

}