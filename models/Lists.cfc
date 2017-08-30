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






//Lists -> Locations Methods: Read
//Lists -> Members Methods: Create
//Lists -> Members Methods: Edit
//Lists -> Members Methods: Delete

//Lists -> Members -> Member Activity Methods: Read

//Lists -> Members -> Member Goals Methods: Read

//Lists -> Members -> Member Notes Methods: Create
//Lists -> Members -> Member Notes Methods: Read
//Lists -> Members -> Member Notes Methods: Edit
//Lists -> Members -> Member Notes Methods: Delete

//Lists -> Merge Fields Methods: Create
//Lists -> Merge Fields Methods: Read
//Lists -> Merge Fields Methods: Edit
//Lists -> Merge Fields Methods: Delete

//Lists -> Segments Methods: Create
//Lists -> Segments Methods: Read
//Lists -> Segments Methods: Edit
//Lists -> Segments Methods: Delete

//Lists -> Segments -> Segment Members Methods: Create
//Lists -> Segments -> Segment Members Methods: Read
//Lists -> Segments -> Segment Members Methods: Delete

//Lists -> Signup Forms Methods: Create
//Lists -> Signup Forms Methods: Read

//Lists -> Webhooks Methods: Create
//Lists -> Webhooks Methods: Read
//Lists -> Webhooks Methods: Edit
//Lists -> Webhooks Methods: Delete












//Lists Methods: Create

  /**
   * Create a new list.
   *
   * @param string name
   *   The name of the list.
   * @param struct contact
   *   Contact information displayed in campaign footers to comply with international spam laws.
   *   Elements of this struct are: company, address1, address2, city, state, zip, country, phone
   * @param string permission_reminder
   *   The permission reminder for the list.
   * @param boolean use_archive_bar
   *   Whether campaigns for this list use the Archive Bar in archives by default.
   * @param struct campaign_defaults
   *   Default values for campaigns created for this list.
   *   Elements of the struct are: from_name, from_email, subject, language
   * @param string notify_on_subscribe
   *   The email address to send subscribe notifications to.
   * @param string notify_on_unsubscribe
   *   The email address to send unsubscribe notifications to.
   * @param boolean email_type_option
   *   Whether the list supports multiple formats for emails.
   *   When set to true, subscribers can choose whether they want to receive HTML or plain-text emails.
   *   When set to false, subscribers will receive HTML emails, with a plain-text alternative backup.
   * @param string visibility
   *   Whether this list is public or private. Possible Values: pub, prv
   *
   *
   *
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/lists/#create-post_lists
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
   * Batch subscribe or unsubscribe list members.
   *
   * @param string list_id
   *   The ID of the list.
   * @param array members
   *   An array of structs of elements, each representing an email address and the subscription status for a specific list.
   *   Up to 500 members may be added or updated with each API call.
   *   Elements of the struct are: email_address, email_type, status, merge_fields, interests, language, vip,
   *   struct location (latitude, longitude), ip_signup, timestamp_signup, ip_opt, timestamp_opt
   * @param boolean update_existing
   *   Whether this batch operation will change existing members’ subscription status.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/lists/#create-post_lists_list_id
   */
	public function batchListMembers(
		string list_id
		,array members =[
			{
				"email_address": "",
				"email_type": "",	// text or hmtl
				"status": "",		// subscribed unsubscribed cleaned pending
				"merge_fields": {},
				"interests": {},
				"language": "",
				"vip": false,
				"location": [{"latitude":0,"longitude":0}],
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


//Lists Methods: Read

  /**
   * Gets information about all lists owned by the authenticated account.
   *
   * @param array fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param array exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   * @param numeric count
   *   The number of records to return. Default value is 10.
   * @param numeric offset
   *   The number of records from a collection to skip.
   *   Iterating over large collections with this parameter can be slow. Default value is 0.
   * @param string before_date_created
   *   Restrict response to lists created before the set date.
   * @param string since_date_created
   *   Restrict results to lists created after the set date.
   * @param string before_campaign_last_sent
   *   Restrict results to lists created before the last campaign send date.
   * @param string since_campaign_last_sent
   *   Restrict results to lists created after the last campaign send date.
   * @param string email
   *   Restrict results to lists that include a specific subscriber’s email address.
   * @param string sort_field
   *   Returns files sorted by the specified field. Possible Values: date_created
   * @sort_dir
   *   Determines the order direction for sorted results. Possible Values: ASC, DESC
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/lists/#read-get_lists
   */
  public function getLists() {
    return getClient().mailchimpRequest('GET', '/lists', arguments);
  }


  /**
   * Gets a MailChimp list.
   *
   * @param string list_id
   *   The ID of the list.
   * @param array fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param array exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/lists/#read-get_lists_list_id
   */
  public function getList(list_id) {

    return getClient().mailchimpRequest('GET', '/lists/{list_id}', arguments);
  }



//Lists Methods: Edit

	/**
   * Edit a List.
   *
   * @param string list_id
   *   The unique id for the list.
   * @param string name
   *   The name of the list.
   * @param struct contact
   *   Contact information displayed in campaign footers to comply with international spam laws.
   *   Elements of this struct are: company, address1, address2, city, state, zip, country, phone
   * @param string permission_reminder
   *   The permission reminder for the list.
   * @param boolean use_archive_bar
   *   Whether campaigns for this list use the Archive Bar in archives by default.
   * @param struct campaign_defaults
   *   Default values for campaigns created for this list.
   *   Elements of the struct are: from_name, from_email, subject, language
   * @param string notify_on_subscribe
   *   The email address to send subscribe notifications to.
   * @param string notify_on_unsubscribe
   *   The email address to send unsubscribe notifications to.
   * @param boolean email_type_option
   *   Whether the list supports multiple formats for emails.
   *   When set to true, subscribers can choose whether they want to receive HTML or plain-text emails.
   *   When set to false, subscribers will receive HTML emails, with a plain-text alternative backup.
   * @param string visibility
   *   Whether this list is public or private. Possible Values: pub, prv
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/lists/#edit-patch_lists_list_id
   */
  public function editList(
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

    return getClient().mailchimpRequest('PATCH', '/lists/{list_id}', arguments);
  }


//Lists Methods: Delete

   /**
   * Deletes a MailChimp list.
   *
   * @param string list_id
   *   The ID of the list.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/lists/#delete-delete_lists_list_id
   */
  public function deleteList(list_id) {
    return getClient().mailchimpRequest('DELETE', '/lists/{list_id}',{'list_id':arguments.list_Id});
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
   *   The number of records to return. Default value is 10.
   * @param string offset
   *   The number of records from a collection to skip. Iterating over large collections with this parameter can be slow. Default value is 0.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/lists/abuse-reports/#read-get_lists_list_id_abuse_reports
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
   * @param string report_id
   *   The id for the abuse report.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   * @param string count
   *   The number of records to return. Default value is 10.
   * @param string offset
   *   The number of records from a collection to skip. Iterating over large collections with this parameter can be slow. Default value is 0.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/abuse-reports/
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
// Activity
// Get recent daily, aggregated activity stats for your list. For example, view unsubscribes, signups, total emails
// sent, opens, clicks, and more, for up to 180 days.
// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  /**
   * 	Get recent list activity
   *
   * @param string list_id
   *   The ID of the list.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/lists/activity/#read-get_lists_list_id_activity
   */
  public function getActivity(list_id, fields,exclude_fields) {

    return getClient().mailchimpRequest('GET', '/lists/{list_id}/activity', arguments);
  }



// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Clients
// Get information about the most popular email clients for subscribers in a specific MailChimp list.
// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  /**
   * 	Get a list of the top email clients based on user-agent strings.
   *
   * @param string list_id
   *   The ID of the list.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/lists/clients/#read-get_lists_list_id_clients
   */
  public function getClients(list_id, fields,exclude_fields) {

    return getClient().mailchimpRequest('GET', '/lists/{list_id}/clients', arguments);
  }


// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Growth History
// View a summary of the month-by-month growth activity for a specific list.
// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  /**
   * 	Get a month-by-month summary of a specific list's growth activity.
   *
   * @param string list_id
   *   The ID of the list.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   * @param string count
   *   The number of records to return. Default value is 10.
   * @param string offset
   *   The number of records from a collection to skip. Iterating over large collections with this parameter can be slow. Default value is 0.
   *
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/lists/growth-history/#read-get_lists_list_id_growth_history
   */
  public function getGrowthHistory(list_id, fields,exclude_fields,count=10,offset=0) {

    return getClient().mailchimpRequest('GET', '/lists/{list_id}/growth-history', arguments);
  }

  /**
   * 	Get a summary of a specific list's growth activity for a specific month and year.
   *
   * @param string list_id
   *   The ID of the list.
   * @param string month
   *   A specific month of list growth history. format: yyyy-mm e.g. 2017-07
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/lists/growth-history/#read-get_lists_list_id_growth_history_month
   */
  public function getGrowthHistoryByMonth(list_id,month,fields,exclude_fields) {

    return getClient().mailchimpRequest('GET', '/lists/{list_id}/growth-history/{month}', arguments);
  }



// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Interest Categories
// Manage interest categories for a specific list. Interest categories organize interests,
// which are used to group subscribers based on their preferences.
// These correspond to ‘group titles’ in the MailChimp application. Learn more about groups in MailChimp.
// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


 /**
   * Create a new interest category
   *
   * @param string list_id
   *   The ID of the list.
   * @param string title
   *   The text description of this category. This field appears on signup forms and is often phrased as a question.
   * @param numeric display_order
   *   The order that the categories are displayed in the list. Lower numbers display first.
   * @param string type
   *   Determines how this category’s interests appear on signup forms. Possible Values: checkboxes, dropdown, radio, hidden
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/lists/growth-history/#read-get_lists_list_id_growth_history_month
   */
  public function addInterestCategory(required list_id, required title, display_order=0, required type) {

    return getClient().mailchimpRequest('POST', '/lists/{list_id}/interest-categories', arguments);
  }

   /**
   * Get information about a list's interest categories
   *
   * @param string list_id
   *   The ID of the list.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   * @param string count
   *   The number of records to return. Default value is 10.
   * @param string offset
   *   The number of records from a collection to skip. Iterating over large collections with this parameter can be slow. Default value is 0.
   * @param string type
   *   Restrict results a type of interest group
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/lists/interest-categories/#read-get_lists_list_id_interest_categories
   */
  public function getInterestCategories(required list_id) {

    return getClient().mailchimpRequest('GET', '/lists/{list_id}/interest-categories', arguments);
  }

   /**
   * Get information about a specific interest category
   *
   * @param string list_id
   *   The ID of the list.
   * @param string interest_category_id
   *   The unique id for the interest category.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/lists/interest-categories/#read-get_lists_list_id_interest_categories
   */
  public function getInterestCategory(required list_id, required interest_category_id) {

    return getClient().mailchimpRequest('GET', '/lists/{list_id}/interest-categories/{interest_category_id}', arguments);
  }


   /**
   * Update an existing interest category
   *
   * @param string list_id
   *   The ID of the list.
   * @param string interest_category_id
   *   The unique id for the interest category.
   * @param string title
   *   The text description of this category. This field appears on signup forms and is often phrased as a question.
   * @param numeric display_order
   *   The order that the categories are displayed in the list. Lower numbers display first.
   * @param string type
   *   Determines how this category’s interests appear on signup forms. Possible Values: checkboxes, dropdown, radio, hidden
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/lists/interest-categories/#edit-patch_lists_list_id_interest_categories_interest_category_id
   */
  public function updateInterestCategory(required list_id, required interest_category_id, required title, display_order=0, required type) {

    return getClient().mailchimpRequest('PATCH', '/lists/{list_id}/interest-categories/{interest_category_id}', arguments);
  }

   /**
   * Delete a specific interest category
   *
   * @param string list_id
   *   The ID of the list.
   * @param string interest_category_id
   *   The unique id for the interest category.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/lists/interest-categories/#delete-delete_lists_list_id_interest_categories_interest_category_id
   */
  public function deleteInterestCategory(required list_id, required interest_category_id) {

    return getClient().mailchimpRequest('DELETE', '/lists/{list_id}/interest-categories/{interest_category_id}', arguments);
  }



// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Interest Categories -> Interests
// Manage interests for a specific MailChimp list. Assign subscribers to interests to group them together.
// Interests are referred to as ‘group names’ in the MailChimp application. Learn more about using groups in MailChimp.
// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

   /**
   * Create a new interest in a specific category
   *
   * @param string list_id
   *   The ID of the list.
   * @param string interest_category_id
   *   The unique id for the interest category.
   * @param string name
   *   The name of the interest. This can be shown publicly on a subscription form.
   * @param numeric display_order
   *   The display order for interests.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/lists/interest-categories/interests/#create-post_lists_list_id_interest_categories_interest_category_id_interests
   */
  public function addInterestToInterestsCategory(required list_id, required interest_category_id, required name, display_order=0) {

    return getClient().mailchimpRequest('POST', '/lists/{list_id}/interest-categories/{interest_category_id}/interests', arguments);
  }

   /**
   * Get all interests in a specific interests category
   *
   * @param string list_id
   *   The ID of the list.
   * @param string interest_category_id
   *   The unique id for the interest category.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   * @param string count
   *   The number of records to return. Default value is 10.
   * @param string offset
   *   The number of records from a collection to skip. Iterating over large collections with this parameter can be slow. Default value is 0.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/lists/interest-categories/interests/#read-get_lists_list_id_interest_categories_interest_category_id_interests
   */
  public function getAllInterestsInInterestsCategory(required list_id, required interest_category_id, fields='', exclude_fields='', numeric count=10, numeric offset=0) {

    return getClient().mailchimpRequest('GET', '/lists/{list_id}/interest-categories/{interest_category_id}/interests', arguments);
  }

    /**
   * Get interest in a specific interests category
   *
   * @param string list_id
   *   The ID of the list.
   * @param string interest_category_id
   *   The unique id for the interest category.
   * @param string interest_id
   *   The specific interest or 'group name'.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/lists/interest-categories/interests/#read-get_lists_list_id_interest_categories_interest_category_id_interests_interest_id
   */
  public function getInterestInInterestsCategory(required list_id, required interest_category_id, required interest_id, fields='', exclude_fields='') {

    return getClient().mailchimpRequest('GET', '/lists/{list_id}/interest-categories/{interest_category_id}/interests/{interest_id}', arguments);
  }

   /**
   * Update interest in a specific interests category
   *
   * @param string list_id
   *   The ID of the list.
   * @param string interest_category_id
   *   The unique id for the interest category.
   * @param string interest_id
   *   The specific interest or 'group name'.
   * @param string name
   *   The name of the interest. This can be shown publicly on a subscription form.
   * @param numeric display_order
   *   The display order for interests.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/lists/interest-categories/interests/#edit-patch_lists_list_id_interest_categories_interest_category_id_interests_interest_id
   */
  public function updateInterestInInterestsCategory(required list_id, required interest_category_id, required interest_id, required name, display_order=0) {

    return getClient().mailchimpRequest('PATCH', '/lists/{list_id}/interest-categories/{interest_category_id}/interests/{interest_id}', arguments);
  }

   /**
   * Delete interest in a specific interests category
   *
   * @param string list_id
   *   The ID of the list.
   * @param string interest_category_id
   *   The unique id for the interest category.
   * @param string interest_id
   *   The specific interest or 'group name'.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/lists/interest-categories/interests/#delete-delete_lists_list_id_interest_categories_interest_category_id_interests_interest_id
   */
  public function deleteInterestInInterestsCategory(required list_id, required interest_category_id, required interest_id) {

    return getClient().mailchimpRequest('DELETE', '/lists/{list_id}/interest-categories/{interest_category_id}/interests/{interest_id}', arguments);
  }


// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Locations
// Get the locations (countries) that the list’s subscribers have been tagged to based on geocoding their IP address.
// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

   /**
   * Get list locations
   *
   * @param string list_id
   *   The ID of the list.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/lists/locations/#read-get_lists_list_id_locations
   */
  public function getLocations(required list_id) {

    return getClient().mailchimpRequest('GET', '/lists/{list_id}/locations', arguments);
  }


// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Members
// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  /**
   * Gets information about all members of a MailChimp list.
   *
   * @param string list_id
   *   The ID of the list.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   * @param numeric count
   *   The number of records to return. Default value is 10.
   * @param numeric offset
   *   The number of records from a collection to skip. Iterating over large collections with this parameter can be slow. Default value is 0.
   * @param string email_type
   *   The email type.
   * @param string status
   *   The subscriber’s status.
   * @param string since_timestamp_opt
   *   Restrict results to subscribers who opted-in after the set timeframe. We recommend ISO 8601 time format: 2015-10-21T15:41:36+00:00.
   * @param string before_timestamp_opt
   *   Restrict results to subscribers who opted-in before the set timeframe. We recommend ISO 8601 time format: 2015-10-21T15:41:36+00:00.
   * @param string since_last_changed
   *   Restrict results to subscribers whose information changed after the set timeframe.
   * @param string before_last_changed
   *   Restrict results to subscribers whose information changed before the set timeframe.
   * @param string unique_email_id
   *   A unique identifier for the email address across all MailChimp lists. This parameter can be found in any links with Ecommerce Tracking enabled.
   * @param boolean vip_only
   *   A filter to return only the list’s VIP members. Passing true will restrict results to VIP list members, passing false will return all list members.
   * @param string interest_category_id
   *   The unique id for the interest category.
   * @param string interest_ids
   *   Used to filter list members by interests. Must be accompanied by interest_category_id and interest_match. The value must be a comma separated list of interest ids present for the given interest category.
   * @param string interest_match
   *   Used to filter list members by interests. Must be accompanied by interest_category_id and interest_ids.
   *   "any" will match a member with any of the interest supplied, “all” will only match members with every interest supplied, and "none" will match members without any of the interest supplied.
   *   Possible Values: any, all, none
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/lists/members/#read-get_lists_list_id_members
   */
  public function getMembers(
   required string list_id
   ,fields=''
   ,exclude_fields=''
   ,count=10
   ,offset=0
   ,email_type
   ,status
   ,since_timestamp_opt
   ,before_timestamp_opt
   ,since_last_changed
   ,before_last_changed
   ,unique_email_id
   ,vip_only
   ,interest_category_id
   ,interest_ids
   ,interest_match
   ) {

    return getClient().mailchimpRequest('GET', '/lists/{list_id}/members', arguments);
  }

  /**
   * Adds a new member to a MailChimp list.
   *
   * @param string list_id
   *   The ID of the list.
   * @param string email_address
   *   Email address for a subscriber.
   * @param string status
   *   Subscriber’s current status. Possible Values: subscribed, unsubscribed, cleaned, pending
   * @param string email_type
   *   Type of email this member asked to get (‘html’ or ‘text’).
   * @param struct merge_fields
   *   An individual merge var and value for a member.
   * @param struct interests
   *   The key of this object’s properties is the ID of the interest in question.
   * @param string language
   *   If set/detected, the subscriber’s language.
   * @param boolean vip
   *   VIP status for subscriber.
   * @param struct location
   *   Subscriber location information, numetic latitude, longitude
   * @param string ip_signup
   *   IP address the subscriber signed up from.
   * @param string timestamp_signup
   *   The date and time the subscriber signed up for the list.
   * @param string ip_opt
   *   The IP address the subscriber used to confirm their opt-in status.
   * @param string timestamp_opt
   *   The date and time the subscribe confirmed their opt-in status.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/members/#create-post_lists_list_id_members
   */
  public function addMember(
     required list_id
     ,required email_address
     ,required status
     ) {

    return getClient().mailchimpRequest('POST', '/lists/{list_id}/members', arguments);
  }


  /**
   * Gets information about a member of a MailChimp list.
   *
   * @param string list_id
   *   The ID of the list.
   * @param string email
   *   The member's email address.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/lists/members/#read-get_lists_list_id_members_subscriber_hash
   */
  public function getMemberInfo(list_id, email, fields='', exclude_fields='') {
      arguments.subscriber_hash = hash(lcase(email),'md5');

    return getClient().mailchimpRequest('GET', '/lists/{list_id}/members/{subscriber_hash}', arguments);
  }


   /**
   * Updates a member of a MailChimp list.
   *
   * @param string list_id
   *   The ID of the list.
   * @param string email
   *   The member's email address.
   * @param string email_address
   *   Email address for a subscriber.
   * @param string email_type
   *   Type of email this member asked to get ('html' or 'text').
   * @param string status
   *   Subscriber’s current status. Possible Values: subscribed, unsubscribed, cleaned, pending
   * @param struct merge_fields
   *   An individual merge var and value for a member.
   * @param struct interests
   *   The key of this object’s properties is the ID of the interest in question.
   * @param string language
   *   If set/detected, the subscriber’s language.
   * @param boolean vip
   *   VIP status for subscriber.
   * @param struct location
   *   Subscriber location information, numetic latitude, longitude
   * @param string ip_signup
   *   IP address the subscriber signed up from.
   * @param string timestamp_signup
   *   The date and time the subscriber signed up for the list.
   * @param string ip_opt
   *   The IP address the subscriber used to confirm their opt-in status.
   * @param string timestamp_opt
   *   The date and time the subscribe confirmed their opt-in status.
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/lists/members/#edit-patch_lists_list_id_members_subscriber_hash
   */
  public function updateMember(
    list_id
    ,email
    ,email_address
    ,batch = FALSE) {
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
   * @param string email_address
   *   Email address for a subscriber. This value is required only if the email address is not already present on the list.
   * @param string status_if_new
   *   Subscriber’s status. This value is required only if the email address is not already present on the list.
   *   Possible Values: subscribed, unsubscribed, cleaned, pending, transactional
   * @param string email_type
   *   Type of email this member asked to get ('html' or 'text').
   * @param string status
   *   Subscriber’s current status. Possible Values: subscribed, unsubscribed, cleaned, pending
   * @param struct merge_fields
   *   An individual merge var and value for a member.
   * @param struct interests
   *   The key of this object’s properties is the ID of the interest in question.
   * @param string language
   *   If set/detected, the subscriber’s language.
   * @param boolean vip
   *   VIP status for subscriber.
   * @param struct location
   *   Subscriber location information, numetic latitude, longitude
   * @param string ip_signup
   *   IP address the subscriber signed up from.
   * @param string timestamp_signup
   *   The date and time the subscriber signed up for the list.
   * @param string ip_opt
   *   The IP address the subscriber used to confirm their opt-in status.
   * @param string timestamp_opt
   *   The date and time the subscribe confirmed their opt-in status.
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/members/#edit-put_lists_list_id_members_subscriber_hash
   */
  public function addOrUpdateMember(
    required list_id
    ,required email
    ,email_address
    ,status_if_new
    ,email_type
    ,status
    ,merge_fields
    ,interests
    ,language
    ,vip = false
    ,location
    ,ip_signup
    ,timestamp_signup
    ,ip_opt
    ,timestamp_opt
    ,batch = FALSE) {
      arguments.subscriber_hash = hash(lcase(email),'md5');

    return getClient().mailchimpRequest('PUT', '/lists/{list_id}/members/{subscriber_hash}', arguments, batch);
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
   * Search all campaigns for the specified query terms.
   *
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   * @param string query
   *   The search query used to filter results.
   * @param string list_id
   *   The unique id for the list.
   * @param numeric offset
   *   The number of records from a collection to skip. Iterating over large collections with this parameter can be slow. Default value is 0.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/search-campaigns/
   */
  public function searchMembers(
  	string fields
  	,string exclude_fields
  	,string query
  	,string list_id
  	,numeric offset=0
  	) {
    return getClient().mailchimpRequest('GET', '/search-members',arguments);
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