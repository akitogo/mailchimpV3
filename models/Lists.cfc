/**
 * Mailchimp Lists library.
 *
 */
component  {

	any function getClient() provider="mailchimp@mailchimpv3"{
	}

	variables.MEMBER_STATUS_SUBSCRIBED		=	'subscribed';
	variables.MEMBER_STATUS_UNSUBSCRIBED 	=	'unsubscribed';
	variables.MEMBER_STATUS_CLEANED 		=	'cleaned';
	variables.MEMBER_STATUS_PENDING 		= 	'pending';
  
	variables.LIST_VISIBILITY_PUBLIC		=	'pub';		
	variables.LIST_VISIBILITY_PRIVATE		=	'prv';		


  /**
   * Gets information about all lists owned by the authenticated account.
   *
   * @param array parameters
   *   Associative array of optional request parameters.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/#read-get_lists
   */
  public function getLists() {
    return getClient().mailchimpRequest('GET', '/lists', arguments);
  }

  /**
   * Create a new list.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/#
   */
  public function addList(
  	string name
  	,struct contact =
	{
  		"company": "",
		"address1": "",
		"address2": "",
		"city": "",
		"state": "",
		"zip": "",
		"country": "",
		"phone": ""
  	}
  	,permission_reminder
  	,boolean use_archive_bar = FALSE
  	,struct campaign_defaults  =
  	{
		"from_name": "",
		"from_email": "",
		"subject": "",
		"language": ""  		
	}
  	,notify_on_subscribe = ''
  	,notify_on_unsubscribe = ''
  	,boolean email_type_option = FALSE
  	,string visibility = LIST_VISIBILITY_PUBLIC
  	) {

    return getClient().mailchimpRequest('POST', '/lists', arguments);
  }

  /**
   * Gets a MailChimp list.
   *
   * @param string list_id
   *   The ID of the list.
   * @param array parameters
   *   Associative array of optional request parameters.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/#read-get_lists_list_id
   */
  public function getList(list_id) {

    return getClient().mailchimpRequest('GET', '/lists/{list_id}', arguments);
  }
 
   /**
   * Deletes a MailChimp list.
   *
   * @param string list_id
   *   The ID of the list.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/#read-get_lists_list_id
   */
  public function deleteList(list_id) {
    return getClient().mailchimpRequest('DELETE', '/lists/{list_id}',{'list_id':arguments.list_Id});
  } 
  

  /**
   * Gets merge fields associated with a MailChimp list.
   *
   * @param string list_id
   *   The ID of the list.
   * @param array parameters
   *   Associative array of optional request parameters.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/merge-fields/#read-get_lists_list_id_merge_fields
   */
  public function getMergeFields(list_id) {

    return getClient().mailchimpRequest('GET', '/lists/{list_id}/merge-fields', arguments);
  }

  /**
   * Add merge field associated with a MailChimp list.
   *
   * @param string list_id
   *   The ID of the list.
   * @param string name
   *   The name of the merge field.
   * @param string type
   *   The type for the merge field.
   * @param array parameters
   *   Associative array of optional request parameters.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/merge-fields/#create-post_lists_list_id_merge_fields
   */
  public function addMergeField(list_id, name, type) {

    return getClient().mailchimpRequest('POST', '/lists/{list_id}/merge-fields', arguments);
  }

  /**
   * Gets information about all members of a MailChimp list.
   *
   * @param string list_id
   *   The ID of the list.
   * @param array parameters
   *   Associative array of optional request parameters.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/members/#read-get_lists_list_id_members
   */
  public function getMembers(list_id) {

    return getClient().mailchimpRequest('GET', '/lists/{list_id}/members', arguments);
  }

  /**
   * Gets information about a member of a MailChimp list.
   *
   * @param string list_id
   *   The ID of the list.
   * @param string email
   *   The member's email address.
   * @param array parameters
   *   Associative array of optional request parameters.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/members/#read-get_lists_list_id_members_subscriber_hash
   */
  public function getMemberInfo(list_id, email) {
      arguments.subscriber_hash = hash(lcase(email),'md5');

    return getClient().mailchimpRequest('GET', '/lists/{list_id}/members/{subscriber_hash}', arguments);
  }
  
  
  
// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Abuse Reports
//																														
// Manage abuse complaints for a specific list. An abuse complaint occurs when your recipient reports an email as spam 
// in their mail program.
// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


  /**
   * Get all abuse reports for a specific list.
   *
   * @param string list_id
   *   The ID of the list.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   * @param string count
   *   The number of records to return. 
   * @param string offset
   *   The number of records from a collection to skip. Iterating over large collections with this parameter can be slow. Default value is 0.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/members/activity/#read-get_lists_list_id_members_subscriber_hash_activity
   */
  public function getAbuseReports(
  	list_id
  	,fields
  	,exclude_fields
  	,count=10
  	,offset=0) {

    return getClient().mailchimpRequest('GET', '/lists/{list_id}/abuse-reports', arguments);
  }
  /**
   * Get details about a specific abuse report
   *
   * @param string list_id
   *   The ID of the list.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   * @param string count
   *   The number of records to return. 
   * @param string offset
   *   The number of records from a collection to skip. Iterating over large collections with this parameter can be slow. Default value is 0.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/members/activity/#read-get_lists_list_id_members_subscriber_hash_activity
   */
  public function getAbuseReport(
  	list_id
  	,report_id
  	,fields
  	,exclude_fields
  	,count=10
  	,offset=0) {

    return getClient().mailchimpRequest('GET', ' /lists/{list_id}/abuse-reports/{report_id}', arguments);
  }
  
// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
  /**
   * Gets activity related to a member of a MailChimp list.
   *
   * @param string list_id
   *   The ID of the list.
   * @param string email
   *   The member's email address.
   * @param array parameters
   *   Associative array of optional request parameters.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/members/activity/#read-get_lists_list_id_members_subscriber_hash_activity
   */
  public function getMemberActivity(list_id, email) {
      arguments.subscriber_hash = hash(lcase(email),'md5');

    return getClient().mailchimpRequest('GET', '/lists/{list_id}/members/{subscriber_hash}/activity', arguments);
  }

  /**
   * Adds a new member to a MailChimp list.
   *
   * @param string list_id
   *   The ID of the list.
   * @param string email
   *   The email address to add.
   * @param array parameters
   *   Associative array of optional request parameters.
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/members/#create-post_lists_list_id_members
   */
  public function addMember(list_id, email, batch = FALSE) {

    return getClient().mailchimpRequest('POST', '/lists/{list_id}/members', arguments, batch);
  }

  /**
   * Batch subscribe or unsubscribe list members.
   *
   * @param string list_id
   *   The ID of the list.
   * @param array parameters
   *   Associative array of optional request parameters.
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/members/#create-post_lists_list_id_members
   */
	public function batchListMembers(
		string list_id
		,array members =[
			{
				"email_address": "",
				"email_type": "",	// text or hmtl
				"status": "",		// subscribed unsubscribed cleaned pending
				"merge_fields": "",
				"interests": "",  
				"language": "",  
				"vip": false,  
				"location": {"latitude":0,"longitude":0},  
				"ip_signup":"",
				"timestamp_signup": "",
				"ip_opt":"",
				"timestamp_opt":""
			}
		]
		,boolean update_existing = FALSE
	) {

    return getClient().mailchimpRequest('POST', '/lists/{list_id}', arguments);
  }
  
  /**
   * Removes a member from a MailChimp list.
   *
   * @param string list_id
   *   The ID of the list.
   * @param string email
   *   The member's email address.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/members/#delete-delete_lists_list_id_members_subscriber_hash
   */
  public function removeMember(list_id, email) {
      arguments.subscriber_hash = hash(lcase(email),'md5');

    return getClient().mailchimpRequest('DELETE', '/lists/{list_id}/members/{subscriber_hash}');
  }

  /**
   * Updates a member of a MailChimp list.
   *
   * @param string list_id
   *   The ID of the list.
   * @param string email
   *   The member's email address.
   * @param array parameters
   *   Associative array of optional request parameters.
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/members/#edit-patch_lists_list_id_members_subscriber_hash
   */
  public function updateMember(list_id, email, batch = FALSE) {
      arguments.subscriber_hash = hash(lcase(email),'md5');

    return getClient().mailchimpRequest('PATCH', '/lists/{list_id}/members/{subscriber_hash}', arguments, batch);
  }

  /**
   * Adds a new or update an existing member of a MailChimp list.
   *
   * @param string list_id
   *   The ID of the list.
   * @param string email
   *   The member's email address.
   * @param array parameters
   *   Associative array of optional request parameters.
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/members/#edit-put_lists_list_id_members_subscriber_hash
   */
  public function addOrUpdateMember(list_id, email, batch = FALSE) {
      arguments.subscriber_hash = hash(lcase(email),'md5');

    return getClient().mailchimpRequest('PUT', '/lists/{list_id}/members/{subscriber_hash}', arguments, batch);
  }

  /**
   * Gets information about segments associated with a MailChimp list.
   *
   * @param string list_id
   *   The ID of the list.
   * @param array parameters
   *   Associative array of optional request parameters.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/segments/#read-get_lists_list_id_segments
   */
  public function getSegments(list_id) {

    return getClient().mailchimpRequest('GET', '/lists/{list_id}/segments', arguments);
  }

  /**
   * Gets a MailChimp list segment.
   *
   * @param string list_id
   *   The ID of the list.
   * @param string segment_id
   *   The ID of the list segment.
   * @param array parameters
   *   Associative array of optional request parameters.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/segments/#read-get_lists_list_id_segments_segment_id
   */
  public function getSegment(list_id, segment_id) {

    return getClient().mailchimpRequest('GET', '/lists/{list_id}/segments/{segment_id}', arguments);
  }

  /**
   * Adds a new segment to a MailChimp list.
   *
   * @param string list_id
   *   The ID of the list.
   * @param string name
   *   The name of the segment.
   * @param array parameters
   *   Associative array of optional request parameters.
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/segments/#create-post_lists_list_id_segments
   */
  public function addSegment(list_id, name, batch = FALSE) {

    return getClient().mailchimpRequest('POST', '/lists/{list_id}/segments', arguments, batch);
  }

  /**
   * Updates a segment associated with a MailChimp list.
   *
   * @param string list_id
   *   The ID of the list.
   * @param int segment_id
   *   The ID of the segment.
   * @param string name
   *   The name of the segment.
   * @param array parameters
   *   Associative array of optional request parameters.
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/segments/#edit-patch_lists_list_id_segments_segment_id
   */
  public function updateSegment(list_id, segment_id, name, batch = FALSE) {

    return getClient().mailchimpRequest('PATCH', '/lists/{list_id}/segments/{segment_id}', arguments, batch);
  }

  /**
   * Gets information about members of a list segment.
   *
   * @param string list_id
   *   The ID of the list.
   * @param string segment_id
   *   The ID of the segment.
   * @param array parameters
   *   Associative array of optional request parameters.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/segments/members/#read-get_lists_list_id_segments_segment_id_members
   */
  public function getSegmentMembers(list_id, segment_id) {

    return getClient().mailchimpRequest('GET', '/lists/{list_id}/segments/{segment_id}/members', arguments);
  }

  /**
   * Adds a member to a list segment.
   *
   * @param string list_id
   *   The ID of the list.
   * @param string segment_id
   *   The ID of the segment.
   * @param array email
   *   The email address to add to the segment.
   * @param array parameters
   *   Associative array of optional request parameters.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/segments/members/
   */
  public function addSegmentMember(list_id, segment_id, email) {

    return getClient().mailchimpRequest('POST', '/lists/{list_id}/segments/{segment_id}/members', arguments);
  }

  /**
   * Gets information about webhooks associated with a list.
   *
   * @param string list_id
   *   The ID of the list.
   * @param array parameters
   *   Associative array of optional request parameters.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/webhooks/#read-get_lists_list_id_webhooks
   */
  public function getWebhooks(list_id) {

    return getClient().mailchimpRequest('GET', '/lists/{list_id}/webhooks', arguments);
  }

  /**
   * Gets information about a specific webhook associated with a list.
   *
   * @param string list_id
   *   The ID of the list.
   * @param string webhook_id
   *   The ID of the webhook.
   * @param array parameters
   *   Associative array of optional request parameters.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/webhooks/#read-get_lists_list_id_webhooks_webhook_id
   */
  public function getWebhook(list_id, webhook_id) {

    return getClient().mailchimpRequest('GET', '/lists/{list_id}/webhooks/{webhook_id}', arguments);
  }

  /**
   * Adds a new webhook to a list.
   *
   * @param string list_id
   *   The ID of the list.
   * @param string url
   *   The callback URL the webhook should notify of events.
   * @param array parameters
   *   Associative array of optional request parameters.
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   */
  public function addWebhook(list_id, url, batch = FALSE) {

    return getClient().mailchimpRequest('POST', '/lists/{list_id}/webhooks', arguments, batch);
  }

  /**
   * Deletes a webhook.
   *
   * @param string list_id
   *   The ID of the list.
   * @param string webhook_id
   *   The ID of the webhook.
   * @param array parameters
   *   Associative array of optional request parameters.
   *
   * @return struct
   */
  public function deleteWebhook(list_id, webhook_id) {

    return getClient().mailchimpRequest('DELETE', '/lists/{list_id}/webhooks/{webhook_id}', arguments);
  }

  /**
   * Gets all lists an email address is subscribed to.
   *
   * @param string email
   *   The email address to get lists for.
   *
   * @return array
   *   Array of subscribed list objects.
   *
   * @throws MailchimpAPIException
   */
  public function getListsForEmail(email) {
    var list_data = getLists();

    var subscribed_lists = [];

    // Check each list for a subscriber matching the email address.
    if (list_data.total_items gt 0) {
      for (var list in list_data.lists ) {
        try {
          member_data = getMemberInfo(list.id, email);

          if (isset(member_data.id)) {
            subscribed_lists = list;
          }
        }
        catch (MailchimpAPIException e) {
          if (e.getCode() != 404) {
            // 404 indicates the email address is not subscribed to this list
            // and can be safely ignored. Surface all other exceptions.
            throw new MailchimpAPIException(e.getMessage(), e.getCode(), e);
          }
        }
      }
    }

    return subscribed_lists;
  }

}