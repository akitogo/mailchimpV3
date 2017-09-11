/**
 * Mailchimp Reports library.
 *
 */
component  {


	any function getClient() provider="mailchimp@mailchimpv3"{
	}



  /**
   * Gets a report summary for the authenticated account.
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
   * @param string before_send_time
   *   Restrict the response to campaigns sent before the set time.
   *   We recommend ISO 8601 time format: 2015-10-21T15:41:36+00:00.
   * @param string since_send_time
   *   Restrict the response to campaigns sent after the set time.
   *   We recommend ISO 8601 time format: 2015-10-21T15:41:36+00:00.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/reports/#read-get_reports
   */
  public function getSummary() {
    return getClient().mailchimpRequest('GET', '/reports', arguments);
  }

  /**
   * Gets a report summary for a specific campaign.
   *
   * @param string campaign_id
   *   The ID of the campaign.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/reports/#read-get_reports_campaign_id
   */
  public function getCampaignSummary(campaign_id ) {

    return getClient().mailchimpRequest('GET', '/reports/{campaign_id}', arguments);
  }

  /**
   * Gets a specific report for a specific campaign.
   *
   * @param string campaign_id
   *   The ID of the campaign.
   * @param string type
   *   The type of report to generate path url.
   *    - abuse-reports       @see http://developer.mailchimp.com/documentation/mailchimp/reference/reports/abuse-reports
   *    - advice              @see http://developer.mailchimp.com/documentation/mailchimp/reference/reports/advice
   *    - click-details       @see http://developer.mailchimp.com/documentation/mailchimp/reference/reports/click-details
   *    - domain-performance  @see http://developer.mailchimp.com/documentation/mailchimp/reference/reports/domain-performance
   *    - eepurl              @see http://developer.mailchimp.com/documentation/mailchimp/reference/reports/eepurl
   *    - email-activity      @see http://developer.mailchimp.com/documentation/mailchimp/reference/reports/email-activity
   *    - locations           @see http://developer.mailchimp.com/documentation/mailchimp/reference/reports/locations
   *    - sent-to             @see http://developer.mailchimp.com/documentation/mailchimp/reference/reports/sent-to
   *    - sub-reports         @see http://developer.mailchimp.com/documentation/mailchimp/reference/reports/sub-reports
   *    - unsubscribed        @see http://developer.mailchimp.com/documentation/mailchimp/reference/reports/unsubscribed
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   *   click-details, email-activity, location, sent-to and unsubscribed have also following options:
   * @param numeric count
   *   The number of records to return. Default value is 10.
   * @param numeric offset
   *   The number of records from a collection to skip. Iterating over large collections with this parameter can be slow. Default value is 0.
   *
   * @return struct
   */

  public function getCampaignReport(campaign_id, type ) {

    return getClient().mailchimpRequest('GET', '/reports/{campaign_id}/{type}', arguments);
  }


   /**
   * Get information about a specific abuse report
   *
   * @param string campaign_id
   *   The ID of the campaign.
   * @param string report_id
   *   The id for the abuse report.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/reports/abuse-reports/#read-get_reports_campaign_id_abuse_reports_report_id
   */
  public function getAbuseReportById(campaign_id,report_id ) {

    return getClient().mailchimpRequest('GET', '/reports/{campaign_id}/abuse-reports/{report_id}', arguments);
  }

   /**
   * Get click details for a specific link in a campaign.
   *
   * @param string campaign_id
   *   The ID of the campaign.
   * @param string link_id
   *   The id for the link.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/reports/click-details/#read-get_reports_campaign_id_click_details_link_id
   */
  public function getLinkClickReportByLinkId(campaign_id,link_id ) {

    return getClient().mailchimpRequest('GET', '/reports/{campaign_id}/click-details/{link_id}', arguments);
  }

   /**
   * Get information about list members who clicked on a specific link in a campaign.
   *
   * @param string campaign_id
   *   The ID of the campaign.
   * @param string link_id
   *   The id for the link.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   * @param numeric count
   *   The number of records to return. Default value is 10.
   * @param numeric offset
   *   The number of records from a collection to skip.
   *   Iterating over large collections with this parameter can be slow. Default value is 0.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/reports/click-details/members/#read-get_reports_campaign_id_click_details_link_id_members
   */
  public function getAllLinkClickReports(campaign_id,link_id ) {

    return getClient().mailchimpRequest('GET', '/reports/{campaign_id}/click-details/{link_id}/members', arguments);
  }


   /**
   * Get information about a specific subscriber who clicked a link in a specific campaign.
   *
   * @param string campaign_id
   *   The ID of the campaign.
   * @param string link_id
   *   The id for the link.
   * @param string email
   *   The email address of the subscriber.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/reports/click-details/members/#read-get_reports_campaign_id_click_details_link_id_members_subscriber_hash
   */
  public function getLinkClickMemberReports(campaign_id,link_id,email ) {
    arguments.subscriber_hash = hash(lcase(email),'md5');
    return getClient().mailchimpRequest('GET', '/reports/{campaign_id}/click-details/{link_id}/members/{subscriber_hash}', arguments);
  }

   /**
   * Get a specific list member’s activity in a campaign including opens, clicks, and bounces.
   *
   * @param string campaign_id
   *   The ID of the campaign.
   * @param string email
   *   The email address of the subscriber.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/reports/email-activity/#read-get_reports_campaign_id_email_activity_subscriber_hash
   */
  public function getMemberActivity(campaign_id,email ) {
    arguments.subscriber_hash = hash(lcase(email),'md5');
    return getClient().mailchimpRequest('GET', '/reports/{campaign_id}/email-activity/{subscriber_hash}', arguments);
  }

   /**
   * Get information about a specific campaign recipient.
   *
   * @param string campaign_id
   *   The ID of the campaign.
   * @param string email
   *   The email address of the subscriber.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/reports/sent-to/#read-get_reports_campaign_id_sent_to_subscriber_hash
   */
  public function getMember(campaign_id,email ) {
    arguments.subscriber_hash = hash(lcase(email),'md5');
    return getClient().mailchimpRequest('GET', '/reports/{campaign_id}/sent-to/{subscriber_hash}', arguments);
  }

   /**
   * Get information about a specific list member who unsubscribed from a campaign.
   *
   * @param string campaign_id
   *   The ID of the campaign.
   * @param string email
   *   The email address of the subscriber.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/reports/unsubscribed/#read-get_reports_campaign_id_unsubscribed_subscriber_hash
   */
  public function getUnsubscribedMember(campaign_id,email ) {
    arguments.subscriber_hash = hash(lcase(email),'md5');
    return getClient().mailchimpRequest('GET', '/reports/{campaign_id}/unsubscribed/{subscriber_hash}', arguments);
  }


}