/**
 * Mailchimp Lists library.
 *
 */
component  {


	any function getClient() provider="mailchimp@mailchimpv3"{
	}

// Automations methods: Read

  /**
   * Gets information about all automations owned by the authenticated account.
   *
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   * @param string before_create_time
   *   Restrict the response to automations created before the set time. We recommend ISO 8601 time format: 2015-10-21T15:41:36+00:00.
   * @param string since_create_time
   *   Restrict the response to automations created after the set time. We recommend ISO 8601 time format: 2015-10-21T15:41:36+00:00.
   * @param string before_send_time
   *   Restrict the response to automations sent before the set time. We recommend ISO 8601 time format: 2015-10-21T15:41:36+00:00.
   * @param string since_send_time
   *   Restrict the response to automations sent after the set time. We recommend ISO 8601 time format: 2015-10-21T15:41:36+00:00.
   * @param string status
   *   Restrict the results to automations with the specified status. Possible Values:save paused sending
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/automations/#read-get_automations
   */
  public function getAutomations(
  	string fields
  	,string exclude_fields
  	,string before_create_time
  	,string since_create_time
  	,string before_send_time
  	,string since_send_time
  	,string status
  ) {
    return getClient().mailchimpRequest('GET', '/automations',arguments);
  }

  /**
   * Get information about a specific Automation workflow.
   *
   * @param string workflow_id
   *   The unique id for the Automation workflow.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/automations/#read-get_automations_workflow_id
   */
  public function getWorkflow(string workflow_id, string fields, string exclude_fields) {
    return getClient().mailchimpRequest('GET', '/automations/{workflow_id}',arguments);
  }


// Automations methods: Action

  /**
   * Pause all emails in a specific Automation workflow.
   *
   * @param string workflow_id
   *   The unique id for the Automation workflow.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/automations/#action-post_automations_workflow_id_actions_pause_all_emails
   */
  public function pauseAllWorkflowEmails(string workflow_id) {
    return getClient().mailchimpRequest('POST', '/automations/{workflow_id}/actions/pause-all-emails',arguments);
  }

  /**
   * Start all emails in an Automation workflow.
   *
   * @param string workflow_id
   *   The unique id for the Automation workflow.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/automations/#action-post_automations_workflow_id_actions_start_all_emails
   */
  public function startAllWorkflowEmails(string workflow_id) {
    return getClient().mailchimpRequest('POST', '/automations/{workflow_id}/actions/start-all-emails',arguments);
  }


// Automations -> Emails methods: Read

  /**
   * Gets a list of automated emails in a workflow.
   *
   * @param string workflow_id
   *   The unique id for the Automation workflow.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/automations/emails/#read-get_automations_workflow_id_emails
   */
  public function getWorkflowEmails(string workflow_id) {
    return getClient().mailchimpRequest('GET', '/automations/{workflow_id}/emails',arguments);
  }

  /**
   * Gets information about a specific workflow email.
   *
   * @param string workflow_id
   *   The unique id for the Automation workflow.
   * @param string workflow_email_id
   *   The unique id for the Automation workflow email.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/automations/emails/#read-get_automations_workflow_id_emails
   */
  public function getWorkflowEmail(string workflow_id, string workflow_email_id) {
    return getClient().mailchimpRequest('GET', '/automations/{workflow_id}/emails/{workflow_email_id}',arguments);
  }


// Automations -> Emails methods: Delete


  /**
   *  	Removes an individual Automation workflow email. Emails from certain workflow types,
   *    including the Abandoned Cart Email (abandonedCart) and Product Retargeting Email (abandonedBrowse) Workflows, cannot be deleted.
   *
   * @param string workflow_id
   *   The unique id for the Automation workflow.
   * @param string workflow_email_id
   *   The unique id for the Automation workflow email.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/automations/emails/#delete-delete_automations_workflow_id_emails_workflow_email_id
   */
  public function deleteWorkflowEmail(string workflow_id, string workflow_email_id) {
    return getClient().mailchimpRequest('DELETE', '/automations/{workflow_id}/emails/{workflow_email_id}',arguments);
  }


// Automations -> Emails methods: Action

  /**
   *  	Pause an automated email.
   *
   * @param string workflow_id
   *   The unique id for the Automation workflow.
   * @param string workflow_email_id
   *   The unique id for the Automation workflow email.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/automations/emails/#action-post_automations_workflow_id_emails_workflow_email_id_actions_pause
   */
  public function pauseWorkflowEmail(string workflow_id, string workflow_email_id) {
    return getClient().mailchimpRequest('POST', '/automations/{workflow_id}/emails/{workflow_email_id}/actions/pause',arguments);
  }


  /**
   *  	Start an automated email.
   *
   * @param string workflow_id
   *   The unique id for the Automation workflow.
   * @param string workflow_email_id
   *   The unique id for the Automation workflow email.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/automations/emails/#action-post_automations_workflow_id_emails_workflow_email_id_actions_start
   */
  public function startWorkflowEmail(string workflow_id, string workflow_email_id) {
    return getClient().mailchimpRequest('POST', '/automations/{workflow_id}/emails/{workflow_email_id}/actions/start',arguments);
  }


// Automations -> Emails -> Queue methods: Create

  /**
   * Adds a subscriber to a MailChimp workflow automation email queue.
   *
   * @param string workflow_id
   *   The unique id for the Automation workflow.
   * @param string workflow_email_id
   *   The unique id for the Automation workflow email.
   * @param string email_address
   *   The email address of the subscriber.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/automations/emails/queue/#create-post_automations_workflow_id_emails_workflow_email_id_queue
   */
  public function addWorkflowEmailSubscriber(string workflow_id, string workflow_email_id, string email_address ) {
    return getClient().mailchimpRequest('POST', '/automations/{workflow_id}/emails/{workflow_email_id}/queue',arguments);
  }


// Automations -> Emails -> Queue methods: Read

  /**
   * Gets queued subscribers from a MailChimp workflow automation.
   *
   * @param string workflow_id
   *   The unique id for the Automation workflow.
   * @param string workflow_email_id
   *   The unique id for the Automation workflow email.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/automations/emails/queue/#read-get_automations_workflow_id_emails_workflow_email_id_queue
   */
  public function getWorkflowEmailSubscribers(string workflow_id, string workflow_email_id) {
    return getClient().mailchimpRequest('GET', '/automations/{workflow_id}/emails/{workflow_email_id}/queue',arguments);
  }

  /**
   * Gets a subscriber from a MailChimp workflow automation email queue.
   *
   * @param string workflow_id
   *   The unique id for the Automation workflow.
   * @param string workflow_email_id
   *   The unique id for the Automation workflow email.
   * @param string email
   *   The email address of the subscriber.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/automations/emails/queue/#read-get_automations_workflow_id_emails_workflow_email_id_queue_subscriber_hash
   */
  public function getWorkflowEmailSubscriber(string workflow_id, string workflow_email_id, string email) {
    arguments.subscriber_hash = hash(lcase(email),'md5');
    return getClient().mailchimpRequest('GET', '/automations/{workflow_id}/emails/{workflow_email_id}/queue/{subscriber_hash}',arguments);
  }


// Automations -> Removed Subscribers methods: Create

  /**
   * Remove subscriber from a workflow
   *
   * @param string workflow_id
   *   The unique id for the Automation workflow.
   * @param string email_address
   *   The list member’s email address.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/automations/removed-subscribers/#create-post_automations_workflow_id_removed_subscribers
   */
  public function removeWorkflowSubscriber(string workflow_id, string email_address) {
    return getClient().mailchimpRequest('POST', '/automations/{workflow_id}/removed-subscribers',arguments);
  }


// Automations -> Removed Subscribers methods: Read

  /**
   * Get information about subscribers who were removed from an Automation workflow.
   *
   * @param string workflow_id
   *   The unique id for the Automation workflow.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/automations/removed-subscribers/#read-get_automations_workflow_id_removed_subscribers
   */
  public function getWorkflowRemovedSubscribers(string workflow_id) {
    return getClient().mailchimpRequest('GET', '/automations/{workflow_id}/removed-subscribers',arguments);
  }



}