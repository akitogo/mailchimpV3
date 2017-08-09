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

  /**
   * Gets information about all campaigns owned by the authenticated account.
   *
   * @param array parameters
   *   Associative array of optional request parameters.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/campaigns/#read-get_campaigns
   */
  public function getCampaigns() {
    return getClient().mailchimpRequest('GET', '/campaigns');
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

}