component extends="testbox.system.BaseSpec"
{


	/**
	* @hint Executes before the *set* of all tests.
	*/
	function beforeAll(){
		Campaigns=application.wirebox.getInstance('Campaigns@mailchimpv3');
		lists=application.wirebox.getInstance('lists@mailchimpv3');
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
		/* Replace test@test.com with a real address!							*/
		/*======================================================================*/

		describe("Campaigns", function(){

			it("Get all Campaigns", function(){
				var results = Campaigns.getCampaigns();
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'campaigns' );
				expect( results.campaigns ).toBeArray();
			});

			//create a Test List and add to it subscribers.
			//replace the address test@test.com with your real adresses to see if this test works

            it("Create a test list", function(){
					newList = lists.addList(
				  	name = 'TEST LIST TO TEST CAMPAIGNS'
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
						"from_email": "test@test.com",   //replace address with your own
						"subject": "This is the subject",
						"language": "DE"
				  	}
				  	,notify_on_subscribe = 'subscribe@test.com'
				  	,notify_on_unsubscribe = 'unsubscribe@test.com'
				  	,email_type_option = FALSE
				  	,visibility = 'pub'
 				);

				ListID = newList.id;


				//replace addresses with your own
				//be aware that subscribers may not show up immediately

				lists.addMember(list_id = listID, email_address='test+6@test.com', status='subscribed');
				lists.addMember(list_id = listID, email_address='test+7@test.com', status='subscribed');
				lists.addMember(list_id = listID, email_address='test+8@test.com', status='subscribed');


				//Create a template from a html


				var template1 = fileread('./basic1columnTemplate.html');
				var results = Templates.createTemplate(name='Template to test Campaigns', html=template1);
				templateID = results.id;

			});

				it("Add a new Campaign", function(){
					campaign = Campaigns.addCampaign(
					type = 'regular'
					,recipients =
						{
							 'list_id' : ListID,
							 'segment_opts' : {}
						}
					,settings =
					      {
					      	 'subject_line' : 'First Campaign from API',
					      	 'from_name' : 'TestName',
					      	 'reply_to' : 'test@test.com',
					      	 'template_id' : templateID
					      }
					);

					expect( campaign ).toBeStruct();
					expect( campaign ).toHaveKey( 'id' );
					expect( campaign ).toHaveKey( 'recipients' );
					expect( campaign ).toHaveKey( 'settings' );

					campaignID = campaign.id;

				});


				it("Get a Campaign", function(){
					var results = Campaigns.getCampaign(campaignID);
					expect( results ).toBeStruct();
					expect( results ).toHaveKey( 'id' );
					expect( results.id ).toBe( campaignID );
				});

				//testing updating a name of a campaign
				it("Update a Campaign", function(){
					var results = Campaigns.updateCampaign(
						campaign_id = campaignID
						,type = 'regular'
						,recipients =
							{
							 'list_id' : ListID,
							 'segment_opts' : {}
							}
						,settings =
					      	{
					      	 'subject_line' : 'Updated Name',
					      	 'from_name' : 'TestName',
					      	 'reply_to' : 'test@test.com',
					      	 'template_id' : templateID
					      	}
						);
					expect( results ).toBeStruct();
					expect( results ).toHaveKey( 'settings' );
					expect( results.settings.subject_line ).toBe( 'Updated Name' );
				});



				// this feature works only if you have MailChimp Pro
				it("Cancell a Campaign", function(){
					var results = Campaigns.cancellCampaign(campaignID);
					expect( results ).toBeStruct();
				});

				it("Pause RSS Campaign", function(){
					var results = Campaigns.pauseRSSCampaign(campaignID);
					expect( results ).toBeStruct();
				});

				it("Replicate a campaign", function(){
					var results = Campaigns.replicateCampaign(campaignID);
					expect( results ).toBeStruct();
					//should have same list id
					expect( results.recipients.list_id ).toBe( ListID );
					campaignCopyID = results.id;
				});

				it("Resume RSS Campaign", function(){
					var results = Campaigns.resumeRSSCampaign(campaignID);
					expect( results ).toBeStruct();
				});


				it("Schedule Campaign", function(){
					var results = Campaigns.ScheduleCampaign(campaign_id=campaignID,schedule_time="2017-02-04T19:13:00+00:00");
					expect( results ).toBeStruct();
				});


				//replace members emails with real addresses

				/*it("Send Campaign", function(){
					var results = Campaigns.sendCampaign(campaignID);
					expect( results ).toBeStruct();
					expect( results ).toBeEmpty();
				});*/

				//replace test@test.com with a real address

				/*it("Send a Test Campaign", function(){
					//give here a real email address
					var results = Campaigns.sendTestCampaign(campaign_id=campaignID, test_emails=['test@test.com'], send_type='html');
					expect( results ).toBeStruct();
					expect( results ).toBeEmpty();
				});*/


				it("Unschedule Campaign", function(){
					var results = Campaigns.unschedule(campaignID);
					expect( results ).toBeStruct();
				});



				it("Get campaign content", function(){
					var results = Campaigns.getCampaignContent(campaignID);
					expect( results ).toBeStruct();
					expect( results ).toHaveKey( 'plain_text' );
					expect( results ).toHaveKey( 'html' );
				});




				it("Set campaign content", function(){

					//we are creating for this test a new campaign

					campaign3 = Campaigns.addCampaign(
					type = 'regular'
					,recipients =
						{
							 'list_id' : ListID,
							 'segment_opts' : {}
						}
					,settings =
					      {
					      	 'subject_line' : 'Campain testing set content',
					      	 'from_name' : 'TestName',
					      	 'reply_to' : 'test@test.com',
					      	 'template_id' : templateID
					      }
					);

					campaign3ID = campaign3.id;

					var html = '<html><head><title>Test title</title></head><body>Test body</body></html>';

					var results = Campaigns.setCampaignContent(campaign_id = campaign3ID,html = html);
					expect( results ).toBeStruct();
					expect( results ).toHaveKey( 'html' );
					expect( results.html ).toBe( html );


				});




					it("Get feedback about a campaign", function(){
						var results = Campaigns.getFeedback(campaignID);
						expect( results ).toBeStruct();
						expect( results ).toHaveKey( 'feedback' );
						expect( results.feedback ).toBeArray();

				    });

				    it("Add feedback on a specific campaign.", function(){
				    	var feedback='test feedback';
						var results = Campaigns.addFeedback(campaign_id=campaignID,message=feedback);
						expect( results ).toBeStruct();
						expect( results ).toHaveKey( 'message' );
						expect( results ).toHaveKey( 'feedback_id' );
						expect( results.message ).toBe( feedback );
						feedbackID = results.feedback_id;
				    });

                     it("Get a specific feedback message", function(){
						var results = Campaigns.getFeedbackMessage(campaign_id=campaignID,feedback_id=feedbackID);
						expect( results ).toBeStruct();
						expect( results ).toHaveKey( 'feedback_id' );
						expect( results.feedback_id ).toBe( feedbackID );
				    });

				     it("Update a specific feedback message for a campaign.", function(){
				     	var newFeedback = 'test 2';
						var results = Campaigns.updateFeedbackMessage(campaign_id=campaignID,feedback_id=feedbackID,message=newFeedback);
						expect( results ).toBeStruct();
						expect( results ).toHaveKey( 'message' );
						expect( results.message ).toBe( newFeedback );
				    });

					it("Delete a campaign feedback message", function(){
						var results = Campaigns.deleteFeedbackMessage(campaign_id=campaignID,feedback_id=feedbackID);
						expect( results ).toBeStruct();
						expect( results ).toBeEmpty();
				    });



					it("Get the send checklist for a campaign", function(){
						var results = Campaigns.getSendChecklist(campaign_id=campaignID);
						expect( results ).toBeStruct();
						expect( results ).toHaveKey( 'is_ready' );
						expect( results ).toHaveKey( 'items' );
						expect( results.items ).toBeArray();
				    });



					it("Search all campaigns for the specified query terms.", function(){
						var results = Campaigns.search(campaign_id=campaignID, query = 'TEST LIST TO TEST CAMPAIGNS');
						expect( results ).toBeStruct();
						expect( results ).toHaveKey( 'results' );
						expect( results.results ).toBeArray();

				    });




				it("Delete Campaigns and a list", function(){
					var results = Campaigns.deleteCampaign(campaignID);
					expect( results ).toBeStruct();
					expect( results ).toBeEmpty();
					var results = Campaigns.deleteCampaign(campaignCopyID);
					expect( results ).toBeStruct();
					expect( results ).toBeEmpty();
					var results = Campaigns.deleteCampaign(campaign3ID);
					expect( results ).toBeStruct();
					expect( results ).toBeEmpty();
					var results = lists.deleteList(ListID);
					expect( results ).toBeStruct();
					expect( results ).toBeEmpty();
				});


		});




	}

}