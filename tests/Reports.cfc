component extends="testbox.system.BaseSpec"
{


	/**
	* @hint Executes before the *set* of all tests.
	*/
	function beforeAll(){
		lists=application.wirebox.getInstance('lists@mailchimpv3');
		reports=application.wirebox.getInstance('reports@mailchimpv3');
		Campaigns=application.wirebox.getInstance('Campaigns@mailchimpv3');
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
		/* Conversations																*/
		/*======================================================================*/

		describe("Reports", function(){

			it("Get campaign reports.", function(){
				results = reports.getSummary();
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'reports' );
				expect( results.reports ).toBeArray();
			});


			//we need to create a list, add some subscribers and create a campaign:

			//create a Test List and add to it subscribers.
			//replace the address test@test.com with your real adresses

			it("Create a list and campaign", function(){
					list = lists.addList(
				  	name = 'TEST LIST TO TEST REPORTS'
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

				listID = list.id;

				lists.addMember(list_id = listID, email_address='test+1@test.com', status='subscribed');
				lists.addMember(list_id = listID, email_address='test+2@test.com', status='subscribed');
				lists.addMember(list_id = listID, email_address='test+3@test.com', status='subscribed');

				var template1 = fileread('./basic1columnTemplate.html');
				var results = Templates.createTemplate(name='Template to test Campaigns', html=template1);
				templateID = results.id;

				campaign = Campaigns.addCampaign(
					type = 'regular'
					,recipients =
						{
							 'list_id' : ListID,
							 'segment_opts' : {}
						}
					,settings =
					      {
					      	 'subject_line' : 'Campaign from API to test Reports',
					      	 'from_name' : 'TestName',
					      	 'reply_to' : 'test@test.com',
					      	 'template_id' : templateID
					      }
					);

					campaignID = campaign.id;
			});



			it("Get a specific campaign report", function(){
				results = reports.getCampaignSummary(campaignID);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'subject_line' );
				expect( results.subject_line ).toBe( 'Campaign from API to test Reports' );
			});


			//Gets a specific report for a specific campaign.

			it("Get information about campaign abuse complaints.", function(){
				results = reports.getCampaignReport(campaignID,'abuse-reports');
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'abuse_reports' );
				expect( results.campaign_id ).toBe( campaignID );
			});

			it("Get recent feedback based on a campaign’s statistics.", function(){
				results = reports.getCampaignReport(campaignID,'advice');
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'advice' );
				expect( results.campaign_id ).toBe( campaignID );
			});

			it("Get detailed information about links clicked in campaigns.", function(){
				results = reports.getCampaignReport(campaignID,'click-details');
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'urls_clicked' );
				expect( results.campaign_id ).toBe( campaignID );
			});

			it("Get statistics for the top-performing domains from a campaign.", function(){
				results = reports.getCampaignReport(campaignID,'domain-performance');
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'domains' );
				expect( results.campaign_id ).toBe( campaignID );
			});

			it("Get a summary of social activity for the campaign, tracked by EepURL.", function(){
				results = reports.getCampaignReport(campaignID,'eepurl');
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'eepurl' );
				expect( results.campaign_id ).toBe( campaignID );
			});

			it("Get list member activity for a specific campaign.", function(){
				results = reports.getCampaignReport(campaign_id=campaignID,type='email-activity');
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'emails' );
				expect( results.campaign_id ).toBe( campaignID );
			});

			it("Get top open locations for a specific campaign.", function(){
				results = reports.getCampaignReport(campaignID,'locations');
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'locations' );
				expect( results.campaign_id ).toBe( campaignID );
			});

			it("Get details about campaign recipients.", function(){
				results = reports.getCampaignReport(campaignID,'sent-to');
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'sent_to' );
				expect( results.campaign_id ).toBe( campaignID );
			});

			it("A list of reports for child campaigns of a specific parent campaign.", function(){
				results = reports.getCampaignReport(campaignID,'sub-reports');
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'reports' );
				expect( results.campaign_id ).toBe( campaignID );
			});

			it("Get information about list members who unsubscribed from a specific campaign.", function(){
				results = reports.getCampaignReport(campaignID,'unsubscribed');
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'unsubscribes' );
				expect( results.campaign_id ).toBe( campaignID );
			});

			// some of functions like getAbuseReportById, getAllLinkClickReports etc. we can not test here.
			// mailchimp needs 30 min to collect some information


			//we are done, remove test list and campaign
			it("Clean up", function(){
				var results = Campaigns.deleteCampaign(campaignID);
				expect( results ).toBeStruct();
				expect( results ).toBeEmpty();
				var results = lists.deleteList(listID);
				expect( results ).toBeStruct();
				expect( results ).toBeEmpty();
			});

		});



	}

}