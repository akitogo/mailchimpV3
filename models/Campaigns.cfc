/**
 * Mailchimp Lists library.
 *
 */
component  {

	any function getClient() provider="mailchimp@mailchimpv3"{
	}

  EMAIL_TYPE_HTML = 'html';
  EMAIL_TYPE_PLAIN_TEXT = 'plain_text';

  CAMPAIGN_TYPE_REGULAR = 'regular';
  CAMPAIGN_TYPE_PLAINTEXT = 'plaintext';
  CAMPAIGN_TYPE_ABSPLIT = 'absplit';
  CAMPAIGN_TYPE_RSS = 'rss';
  CAMPAIGN_TYPE_VARIATE = 'variate';


  //Campaigns methods: Create
  //Campaigns methods: Read
  //Campaigns methods: Edit
  //Campaigns methods: Delete
  //Campaigns methods: Action

  //Campaigns -> Content methods: Create
  //Campaigns -> Content methods: Edit

  //Campaigns -> Feedback methods: Create
  //Campaigns -> Feedback methods: Read
  //Campaigns -> Feedback methods: Edit
  //Campaigns -> Feedback methods: Delete

  //Campaigns -> Send Checklist methods: Read








  /**
   * Gets information about all campaigns owned by the authenticated account.
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
   * @param string type
   *   The campaign type. Possible values: regular, plaintext, absplit, rss, variate
   * @param string status
   *   The status of the campaign.
   * @param string before_send_time
   *   Restrict the response to campaigns sent before the set time.
   *   We recommend ISO 8601 time format: 2015-10-21T15:41:36+00:00.
   * @param string since_send_time
   *   Restrict the response to campaigns sent after the set time.
   *   We recommend ISO 8601 time format: 2015-10-21T15:41:36+00:00.
   * @param string before_create_time
   *   Restrict the response to campaigns created before the set time.
   *   We recommend ISO 8601 time format: 2015-10-21T15:41:36+00:00.
   * @param string since_create_time
   *   Restrict the response to campaigns created after the set time.
   *   We recommend ISO 8601 time format: 2015-10-21T15:41:36+00:00.
   * @param string list_id
   *   The unique id for the list.
   * @param string folder_id
   *   The unique folder id.
   * @param string sort_field
   *   Returns files sorted by the specified field. Possible values: create_time, send_time
   * @param string sort_dir
   *   Determines the order direction for sorted results. Possible values: ASC, DESC
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/campaigns/#read-get_campaigns
   */
  public function getCampaigns(
    fields=''
    ,exculde_fields=''
    ,numeric count=10
    ,numeric offset=0
    ,type
    ,status
    ,before_send_time
    ,since_send_time
    ,before_create_time
    ,since_create_time
    ,list_id
    ,folder_id
    ,sort_field
    ,sort_dir
  ) {
    return getClient().mailchimpRequest('GET', '/campaigns',arguments);
  }

  /**
   * Gets information about a specific campaign.
   *
   * @param string campaign_id
   *   The ID of the campaign.
   * @param array parameters
   *   Associative array of optional request parameters.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/campaigns/#read-get_campaigns_campaign_id
   */
  public function getCampaign(campaign_id ) {
    return getClient().mailchimpRequest('GET', '/campaigns/{campaign_id}',arguments);
  }


















  /**
   * Adds a new campaign to the authenticated account.
   *
   * @param string type
   *   The campaign type. See CAMPAIGN_TYPE_* constants.
   * @param object recipients
   *   List settings for the campaign.
   * @param object settings
   *   The subject, from name, reply-to, etc settings for the campaign.
   * @param array parameters
   *   Associative array of optional request parameters.
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/campaigns/#create-post_campaigns
   */
  public function addCampaign(type, recipients, settings,  batch = FALSE) {

    return getClient().mailchimpRequest('POST', '/campaigns',arguments, batch);
  }

  /**
   * Gets the HTML, plain-text, and template content for a MailChimp campaign.
   *
   * @param string campaign_id
   *   The ID of the campaign.
   * @param array parameters
   *   Associative array of optional request parameters.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/campaigns/content/#read-get_campaigns_campaign_id_content
   */
  public function getCampaignContent(campaign_id ) {

    return getClient().mailchimpRequest('GET', '/campaigns/{campaign_id}/content',arguments);
  }

  /**
   * Sets the HTML, plain-text, and template content for a MailChimp campaign.
   *
   * @param string campaign_id
   *   The ID of the campaign.
   * @param array parameters
   *   Associative array of optional request parameters.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/campaigns/content/#edit-put_campaigns_campaign_id_content
   */
  public function setCampaignContent(campaign_id ) {

    return getClient().mailchimpRequest('PUT', '/campaigns/{campaign_id}/content',arguments);
  }

  /**
   * Get the send checklist for a MailChimp campaign.
   *
   * @param string campaign_id
   *   The ID of the campaign.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/campaigns/send-checklist
   */
  public function getSendChecklist(campaign_id) {

    return getClient().mailchimpRequest('GET', '/campaigns/{campaign_id}/send-checklist',arguments);
  }

  /**
   * Updates a campaign.
   *
   * @param string campaign_id
   *   The ID of the campaign.
   * @param string type
   *   The campaign type. See CAMPAIGN_TYPE_* constants.
   * @param object recipients
   *   List settings for the campaign.
   * @param object settings
   *   The subject, from name, reply-to, etc settings for the campaign.
   * @param array parameters
   *   Associative array of optional request parameters.
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/campaigns/#edit-patch_campaigns_campaign_id
   */
  public function updateCampaign(campaign_id, type, recipients, settings,  batch = FALSE) {

    return getClient().mailchimpRequest('PATCH', '/campaigns/{campaign_id}',arguments, batch);
  }

  /**
   * Sends a test email.
   *
   * @param string campaign_id
   *   The ID of the campaign.
   * @param array test_emails
   *   Email addresses to send the test email to.
   * @param string send_type
   *   The type of test email to send.
   * @param array parameters
   *   Associative array of optional request parameters.
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/campaigns/#action-post_campaigns_campaign_id_actions_test
   */
  public function sendTest(campaign_id, test_emails, send_type,  batch = FALSE) {

    return getClient().mailchimpRequest('POST', '/campaigns/{campaign_id}/actions/test',arguments, batch);
  }

  /**
   * Schedule a MailChimp campaign.
   *
   * @param string campaign_id
   *   The ID of the campaign.
   * @param schedule_time schedule_time
   *   The date and time in UTC to schedule the campaign for delivery.
   * @param bool timewarp
   *   Choose whether the campaign should use Timewarp when sending.
   * @param object batch_delivery
   *   Choose whether the campaign should use Batch Delivery.
   *   Cannot be set to true for campaigns using Timewarp.
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/campaigns/#action-post_campaigns_campaign_id_actions_schedule
   */
  public function schedule(campaign_id, schedule_time, timewarp = FALSE, batch_delivery = FALSE, batch = FALSE) {


    return getClient().mailchimpRequest('POST', '/campaigns/{campaign_id}/actions/schedule',arguments, batch);
  }

  /**
   * Unschedule a MailChimp campaign.
   *
   * @param string campaign_id
   *   The ID of the campaign.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/campaigns/#action-post_campaigns_campaign_id_actions_unschedule
   */
  public function unschedule(campaign_id) {

    return getClient().mailchimpRequest('POST', '/campaigns/{campaign_id}/actions/unschedule',arguments);
  }

  /**
   * Send a MailChimp campaign.
   *
   * @param string campaign_id
   *   The ID of the campaign.
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/campaigns/#action-post_campaigns_campaign_id_actions_send
   */
  public function send(campaign_id, batch = FALSE) {

    return getClient().mailchimpRequest('POST', '/campaigns/{campaign_id}/actions/send',arguments, batch);
  }

  /**
   * Deletes a Mailchimp campaign.
   *
   * @param string campaign_id
   *   The ID of the campaign.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/campaigns/#delete-delete_campaigns_campaign_id
   */
  public function delete(campaign_id) {

    return getClient().mailchimpRequest('DELETE', '/campaigns/{campaign_id}',arguments);
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
   * @param string snip_start
   *   To have the match highlighted with something (like a strong HTML tag), both this and snip_end must be passed. This parameter has a 25-character limit.
   * @param string snip_end
   *   To have the match highlighted with something (like a strong HTML tag), both this and snip_start must be passed. This parameter has a 25-character limit.   * @param string offset
   * @param numeric offset
   *   The number of records from a collection to skip. Iterating over large collections with this parameter can be slow. Default value is 0.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/search-campaigns/
   */
  public function search(
  	string fields
  	,string exclude_fields
  	,string query
  	,string snip_start
  	,string snip_end
  	,numeric offset=0) {
    return getClient().mailchimpRequest('GET', '/search-campaigns',arguments);
  }

}