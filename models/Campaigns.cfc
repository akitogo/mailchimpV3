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

  /**
   * Adds a new campaign to the authenticated account.
   *
   * @param string type
   *   The campaign type. There are four types of campaigns you can create in MailChimp.
   *   A/B Split campaigns have been deprecated and variate campaigns should be used instead.
   *   Possible Values: regular, plaintext, absplit, rss, variate
   * @param struct recipients
   *   List settings for the campaign.
   *   Elements of recipients are:
   *   string list_id The unique list id.
   *   struct segment_opts An object representing all segmentation options.
   *   This object should contain a saved_segment_id to use an existing segment,
   *   or you can create a new segment by including both match and conditions options.
   *   Elements of segment_opts are:
   *   numeric saved_segment_id The id for an existing saved segment.
   *   string match Segment match type. Possible values: any, all
   *   struct conditions Segment match conditions.
   *   Elements of conditions are:
   *   string condition_type The type of segment, for example: date, language, Mandrill, static, and more.
   *   Segment Type string from the list, see https://developer.mailchimp.com/documentation/mailchimp/reference/campaigns/#create-post_campaigns
   *   struct Aim Automation Segment - Aim
   *   Elements of Aim are:
   *   string op The member’s status, based on their campaign interaction. Possible values: open, click, sent, noopen, noclick, nosent
   *   string field The segment field, 'aim'.
   *   string value Either the web id value for a specific campaign or ‘any’ to account for subscribers who have or have not interacted with any campaigns.
   * @param object settings
   *   The settings for your campaign, including subject, from name, reply-to address, and more.
   *   Elements of settings are:
   *   string subject_line The subject line for the campaign.
   *   string title The title of the campaign.
   *   string from_name The 'from' name on the campaign (not an email address).
   *   string reply_to The reply-to email address for the campaign.
   *   boolean use_conversation Use MailChimp Conversation feature to manage out-of-office replies.
   *   string to_name The campaign’s custom ‘To’ name. Typically the first name merge field.
   *   string folder_id If the campaign is listed in a folder, the id for that folder.
   *   boolean authenticate Whether MailChimp authenticated the campaign. Defaults to true.
   *   boolean auto_footer Automatically append MailChimp’s default footer to the campaign.
   *   boolean inline_css Automatically inline the CSS included with the campaign content.
   *   boolean auto_tweet Automatically tweet a link to the campaign archive page when the campaign is sent.
   *   array auto_fb_post An array of Facebook page ids to auto-post to.
   *   boolean fb_comments Allows Facebook comments on the campaign (also force-enables the Campaign Archive toolbar). Defaults to true.
   *   numeric template_id The id of the template to use.
   * @param struct variate_settings
   *   The settings specific to A/B test campaigns.
   *   Elements of variate_settings are:
   *   string winner_criteria The combination that performs the best. This may be determined automatically by click rate,
   *   open rate, or total revenue—or you may choose manually based on the reporting data you find the most valuable.
   *   For Multivariate Campaigns testing send_time, winner_criteria is ignored. For Multivariate Campaigns with 'manual' as the winner_criteria,
   *   the winner must be chosen in the MailChimp web application.
   *   Possible values: opens, clicks, manual, total_revenue
   *   numeric wait_time The number of minutes to wait before choosing the winning campaign. The value of wait_time must be greater than 0 and in whole hours, specified in minutes.
   *   numeric test_size The percentage of recipients to send the test combinations to, must be a value between 10 and 100.
   *   array subject_lines The possible subject lines to test. If no subject lines are provided, settings.subject_line will be used.
   *   array send_times The possible send times to test. The times provided should be in the format YYYY-MM-DD HH:MM:SS. If send_times are provided to test, the test_size will be set to 100% and winner_criteria will be ignored.
   *   array from_names The possible from names. The number of from_names provided must match the number of reply_to_addresses. If no from_names are provided, settings.from_name will be used.
   *   array reply_to_addresses The possible reply-to addresses. The number of reply_to_addresses provided must match the number of from_names. If no reply_to_addresses are provided, settings.reply_to will be used.
   * @param struct tracking
   *   The tracking options for a campaign.
   *   Elements of tracking are:
   *   boolean opens Whether to track opens. Defaults to true. Cannot be set to false for variate campaigns.
   *   boolean html_clicks Whether to track clicks in the HTML version of the campaign. Defaults to true. Cannot be set to false for variate campaigns.
   *   boolean text_clicks Whether to track clicks in the plain-text version of the campaign. Defaults to true. Cannot be set to false for variate campaigns.
   *   boolean goal_tracking Whether to enable Goal tracking.
   *   boolean ecomm360 Whether to enable eCommerce360 tracking.
   *   string google_analytics The custom slug for Google Analytics tracking (max of 50 bytes).
   *   string clicktale The custom slug for ClickTale tracking (max of 50 bytes).
   *   struct salesforce Salesforce tracking options for a campaign. Must be using MailChimp’s built-in Salesforce integration.
   *   Elements of salesforce are:
   *   boolean campaign Create a campaign in a connected Salesforce account.
   *   boolean notes Update contact notes for a campaign based on subscriber email addresses.
   *   struct capsule Capsule tracking options for a campaign. Must be using MailChimp’s built-in Capsule integration.
   *   Elements of capsule are:
   *   boolean notes Update contact notes for a campaign based on subscriber email addresses.
   * @param struct rss_opts
   *   RSS options for a campaign.
   *   Elements of rss_opts are:
   *   string feed_url The URL for the RSS feed.
   *   string frequency The frequency of the RSS Campaign. Possible values: daily, weekly, monthly
   *   struct schedule The schedule for sending the RSS Campaign.
   *   Elements of schedule are:
   *   numeric hour The hour to send the campaign in local time. Acceptable hours are 0-23. For example, ‘4’ would be 4am in your account’s default time zone.
   *   struct daily_send The days of the week to send a daily RSS Campaign.
   *   Elements of daily_send are:
   *     boolean sunday Sends the daily RSS Campaign on Sundays.
   *     boolean monday Sends the daily RSS Campaign on Mondays.
   *     boolean tuesday Sends the daily RSS Campaign on Tuesdays.
   *     boolean wednesday Sends the daily RSS Campaign on Wednesdays.
   *     boolean thursday Sends the daily RSS Campaign on Thursdays.
   *     boolean friday Sends the daily RSS Campaign on Fridays.
   *     boolean saturday Sends the daily RSS Campaign on Saturdays.
   *   string weekly_send_day The day of the week to send a weekly RSS Campaign. Possible values: sunday, monday, tuesday, wednesday, thursday, friday, saturday
   *   numeric monthly_send_date The day of the month to send a monthly RSS Campaign. Acceptable days are 0-31,
   *   where ‘0’ is always the last day of a month. Months with fewer than the selected number of days will not have an RSS campaign sent out that day. For example,
   *   RSS Campaigns set to send on the 30th will not go out in February.
   *   boolean constrain_rss_img Whether to add CSS to images in the RSS feed to constrain their width in campaigns.
   * @param struct social_card
   *   The preview for the campaign, rendered by social networks like Facebook and Twitter.
   *   Elements of social_card are:
   *   string image_url The url for the header image for the card.
   *   string description A short summary of the campaign to display.
   *   string title The title for the card. Typically the subject line of the campaign.
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/campaigns/#create-post_campaigns
   */
  public function addCampaign(type, recipients, settings,  batch = FALSE) {

    return getClient().mailchimpRequest('POST', '/campaigns',arguments, batch);
  }



   //Campaigns methods: Read

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
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/campaigns/#read-get_campaigns_campaign_id
   */
  public function getCampaign(campaign_id ) {
    return getClient().mailchimpRequest('GET', '/campaigns/{campaign_id}',arguments);
  }


  //Campaigns methods: Edit

  /**
   * Updates a campaign.
   *
   * @param string campaign_id
   *   The ID of the campaign.
   * @param struct recipients
   *   See function addCampaign
   * @param struct settings
   *   See function addCampaign
   * @param struct variate_settings
   *   See function addCampaign
   * @param struct tracking
   *   See function addCampaign
   * @param struct rss_opts
   *   See function addCampaign
   * @param struct social_card
   *   See function addCampaign
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/campaigns/#edit-patch_campaigns_campaign_id
   */
  public function updateCampaign(campaign_id, type, recipients, settings,  batch = FALSE) {

    return getClient().mailchimpRequest('PATCH', '/campaigns/{campaign_id}',arguments, batch);
  }


  //Campaigns methods: Delete

  /**
   * Deletes a Mailchimp campaign.
   *
   * @param string campaign_id
   *   The ID of the campaign.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/campaigns/#delete-delete_campaigns_campaign_id
   */
  public function deleteCampaign(campaign_id) {

    return getClient().mailchimpRequest('DELETE', '/campaigns/{campaign_id}',arguments);
  }



  //Campaigns methods: Action

  /**
   *  Cancel a Regular or Plain-Text Campaign after you send, before all of your recipients receive it. This feature is included with MailChimp Pro.
   *
   * @param string campaign_id
   *   The ID of the campaign.
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/campaigns/#action-post_campaigns_campaign_id_actions_cancel_send
   */
  public function cancellCampaign(campaign_id, batch = FALSE) {

    return getClient().mailchimpRequest('POST', '/campaigns/{campaign_id}/actions/cancel-send',arguments, batch);
  }

  /**
   *  Pause an RSS-Driven campaign
   *
   * @param string campaign_id
   *   The ID of the campaign.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/campaigns/#action-post_campaigns_campaign_id_actions_pause
   */
  public function pauseRSSCampaign(campaign_id) {

    return getClient().mailchimpRequest('POST', '/campaigns/{campaign_id}/actions/pause',arguments);
  }

  /**
   *  Replicate a campaign
   *
   * @param string campaign_id
   *   The ID of the campaign.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/campaigns/#action-post_campaigns_campaign_id_actions_replicate
   */
  public function replicateCampaign(campaign_id) {

    return getClient().mailchimpRequest('POST', '/campaigns/{campaign_id}/actions/replicate',arguments);
  }

  /**
   *  Resume an RSS-Driven campaign
   *
   * @param string campaign_id
   *   The ID of the campaign.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/campaigns/#action-post_campaigns_campaign_id_actions_resume
   */
  public function resumeRSSCampaign(campaign_id) {

    return getClient().mailchimpRequest('POST', '/campaigns/{campaign_id}/actions/resume',arguments);
  }

  /**
   *  Schedule a campaign for delivery.
   *  If you're using Multivariate Campaigns to test send times or sending RSS Campaigns, use the send action instead.
   *
   * @param string campaign_id
   *   The ID of the campaign.
   * @param string schedule_time
   *   The date and time in UTC to schedule the campaign for delivery. Campaigns may only be scheduled to send on the quarter-hour (:00, :15, :30, :45).
   * @param boolean timewarp
   *   Choose whether the campaign should use Timewarp when sending. Campaigns scheduled with Timewarp are localized
   *   based on the recipients’ time zones. For example, a Timewarp campaign with a schedule_time of 13:00 will be sent
   *   to each recipient at 1:00pm in their local time. Cannot be set to true for campaigns using Batch Delivery.
   * @param struct batch_delivery
   *   Choose whether the campaign should use Batch Delivery. Cannot be set to true for campaigns using Timewarp.
   *   Elements are:
   *   numeric batch_delay The delay, in minutes, between batches.
   *   numeric batch_count The number of batches for the campaign send.
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/campaigns/#action-post_campaigns_campaign_id_actions_schedule
   */
  public function scheduleCampaign(campaign_id,schedule_time,timewarp = FALSE, batch_delivery = FALSE, batch = FALSE) {

    return getClient().mailchimpRequest('POST', '/campaigns/{campaign_id}/actions/schedule',arguments, batch);
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
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/campaigns/#action-post_campaigns_campaign_id_actions_send
   */
  public function sendCampaign(campaign_id, batch = FALSE) {

    return getClient().mailchimpRequest('POST', '/campaigns/{campaign_id}/actions/send',arguments, batch);
  }

 /**
   * Sends a test email.
   *
   * @param string campaign_id
   *   The ID of the campaign.
   * @param array test_emails
   *   Email addresses to send the test email to.
   * @param string send_type
   *   The type of test email to send. Possible values: html, plaintest
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/campaigns/#action-post_campaigns_campaign_id_actions_test
   */
  public function sendTestCampaign(campaign_id, required test_emails, required send_type,  batch = FALSE) {

    return getClient().mailchimpRequest('POST', '/campaigns/{campaign_id}/actions/test',arguments, batch);
  }


  /**
   * Unschedule a MailChimp campaign.
   *
   * @param string campaign_id
   *   The ID of the campaign.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/campaigns/#action-post_campaigns_campaign_id_actions_unschedule
   */
  public function unschedule(campaign_id) {

    return getClient().mailchimpRequest('POST', '/campaigns/{campaign_id}/actions/unschedule',arguments);
  }




  //Campaigns -> Content methods: Read

   /**
   * Gets the HTML, plain-text, and template content for a MailChimp campaign.
   *
   * @param string campaign_id
   *   The ID of the campaign.
   * @param array fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/campaigns/content/#read-get_campaigns_campaign_id_content
   */
  public function getCampaignContent(campaign_id ) {

    return getClient().mailchimpRequest('GET', '/campaigns/{campaign_id}/content',arguments);
  }


  //Campaigns -> Content methods: Edit

  /**
   * Sets the HTML, plain-text, and template content for a MailChimp campaign.
   *
   * @param string campaign_id
   *   The ID of the campaign.
   * @param string plain_text
   *   The plain-text portion of the campaign. If left unspecified, we’ll generate this automatically.
   * @param string html
   *   The raw HTML for the campaign.
   * @param string url
   *   When importing a campaign, the URL where the HTML lives.
   * @param struct template
   *   Use this template to generate the HTML content of the campaign
   *   Elements of template are:
   *   numeric id The id of the template to use.
   *   struct sections Content for the sections of the template.
   *   Each key should be the unique mc:edit area name from the template.
   * @param struct archive
   *   Available when uploading an archive to create campaign content. The archive should include all campaign content and images. Learn more.
   *   Elements of archive are:
   *   string archive_content The base64-encoded representation of the archive file.
   *   string archive_type The type of encoded file. Defaults to zip. Possible values: zip, tar.gz, tar.bz2, tar, tgz, tbz
   * @param array variate_contents
   *   Content options for Multivariate Campaigns. Each content option must provide HTML content and may optionally provide plain text. For campaigns not testing content, only one object should be provided.
   *   Elements of variate_contents are:
   *   string content_label The label used to identify the content option.
   *   string plain_text The plain-text portion of the campaign. If left unspecified, we’ll generate this automatically.
   *   string html The raw HTML for the campaign.
   *   string url When importing a campaign, the URL for the HTML.
   *   struct template Use this template to generate the HTML content for the campaign.
   *   Elements of template are numeric id The id of the template to use and struct sections Content for the sections of the template. Each key should be the unique mc:edit area name from the template.
   *   struct archive Available when uploading an archive to create campaign content. The archive should include all campaign content and images. Learn more.
   *   Elements of archive are:
   *   string archive_content The base64-encoded representation of the archive file.
   *   string archive_type The type of encoded file. Defaults to zip.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/campaigns/content/#edit-put_campaigns_campaign_id_content
   */
  public function setCampaignContent(campaign_id ) {

    return getClient().mailchimpRequest('PUT', '/campaigns/{campaign_id}/content',arguments);
  }







  //Campaigns -> Feedback methods: Create

   /**
   * Add feedback on a specific campaign.
   *
   * @param string campaign_id
   *   The unique id for the campaign.
   * @param numeric block_id
   *   The block id for the editable block that the feedback addresses.
   * @param string message
   *   The content of the feedback.
   * @param bool is_complete
   *   The status of feedback.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/campaigns/feedback/#create-post_campaigns_campaign_id_feedback
   */
  public function addFeedback(campaign_id, message) {

    return getClient().mailchimpRequest('POST', '/campaigns/{campaign_id}/feedback',arguments);
  }


  //Campaigns -> Feedback methods: Read

  /**
   * Get team feedback while you’re working together on a MailChimp campaign.
   *
   * @param string campaign_id
   *   The unique id for the campaign.
   * @param array fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param array exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/campaigns/feedback/#read-get_campaigns_campaign_id_feedback
   */
  public function getFeedback(campaign_id ) {

    return getClient().mailchimpRequest('GET', '/campaigns/{campaign_id}/feedback',arguments);
  }


  /**
   * Get a specific feedback message from a campaign.
   *
   * @param string campaign_id
   *   The unique id for the campaign.
   * @param string feedback_id
   *   The unique id for the feedback message.
   * @param array fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param array exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/campaigns/feedback/#read-get_campaigns_campaign_id_feedback_feedback_id
   */
  public function getFeedbackMessage(campaign_id,feedback_id) {

    return getClient().mailchimpRequest('GET', '/campaigns/{campaign_id}/feedback/{feedback_id}',arguments);
  }


  //Campaigns -> Feedback methods: Edit

   /**
   * Update a specific feedback message for a campaign.
   *
   * @param string campaign_id
   *   The unique id for the campaign.
   * @param string feedback_id
   *   The unique id for the feedback message.
   * @param numeric block_id
   *   The block id for the editable block that the feedback addresses.
   * @param string message
   *   The content of the feedback.
   * @param bool is_complete
   *   The status of feedback.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/campaigns/feedback/#edit-patch_campaigns_campaign_id_feedback_feedback_id
   */
  public function updateFeedbackMessage(campaign_id,feedback_id,message) {

    return getClient().mailchimpRequest('PATCH', '/campaigns/{campaign_id}/feedback/{feedback_id}',arguments);
  }


  //Campaigns -> Feedback methods: Delete

   /**
   * Remove a specific feedback message for a campaign.
   *
   * @param string campaign_id
   *   The unique id for the campaign.
   * @param string feedback_id
   *   The unique id for the feedback message.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/campaigns/feedback/#delete-delete_campaigns_campaign_id_feedback_feedback_id
   */
  public function deleteFeedbackMessage(campaign_id,feedback_id) {

    return getClient().mailchimpRequest('DELETE', '/campaigns/{campaign_id}/feedback/{feedback_id}',arguments);
  }


  //Campaigns -> Send Checklist methods: Read

  /**
   * Get the send checklist for a MailChimp campaign.
   *
   * @param string campaign_id
   *   The ID of the campaign.
   * @param array fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param array exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/campaigns/send-checklist/#read-get_campaigns_campaign_id_send_checklist
   */
  public function getSendChecklist(campaign_id) {

    return getClient().mailchimpRequest('GET', '/campaigns/{campaign_id}/send-checklist',arguments);
  }


// Search Campaigns

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
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/search-campaigns/#read-get_search_campaigns
   */
  public function search(
  	string fields
  	,string exclude_fields
  	,required string query
  	,string snip_start
  	,string snip_end
  	,numeric offset=0) {
    return getClient().mailchimpRequest('GET', '/search-campaigns',arguments);
  }

}