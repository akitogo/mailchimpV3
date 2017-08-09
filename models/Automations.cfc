/**
 * Mailchimp Lists library.
 *
 */
component  {
	

	any function getClient() provider="mailchimp@mailchimpv3"{
	}
	
  /**
   * Gets information about all automations owned by the authenticated account.
   *
   * @param array parameters
   *   Associative array of optional request parameters.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/automations/#read-get_automations
   */
  public function getAutomations() {
    return getClient().mailchimpRequest('GET', '/automations');
  }

  /**
   * Get information about a specific Automation workflow.
   *
   * @param string workflow_id
   *   The unique id for the Automation workflow.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/automations/#read-get_automations_workflow_id
   */
  public function getWorkflow(workflow_id) {

    return getClient().mailchimpRequest('GET', '/automations/{workflow_id}',arguments);
  }

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
  public function getWorkflowEmails(workflow_id) {
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
  public function getWorkflowEmail(workflow_id, workflow_email_id) {

    return getClient().mailchimpRequest('GET', '/automations/{workflow_id}/emails/{workflow_email_id}',arguments);
  }

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
  public function getWorkflowEmailSubscribers(workflow_id, workflow_email_id) {

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
  public function getWorkflowEmailSubscriber(workflow_id, workflow_email_id, email) {
    arguments.subscriber_hash = hash(lcase(email),'md5');


    return getClient().mailchimpRequest('GET', '/automations/{workflow_id}/emails/{workflow_email_id}/queue/{subscriber_hash}',arguments);
  }

  /**
   * Adds a subscriber to a MailChimp workflow automation email queue.
   *
   * @param string workflow_id
   *   The unique id for the Automation workflow.
   * @param string workflow_email_id
   *   The unique id for the Automation workflow email.
   * @param string email
   *   The email address of the subscriber.
   * @param array parameters
   *   Associative array of optional request parameters.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/automations/emails/queue/#create-post_automations_workflow_id_emails_workflow_email_id_queue
   */
  public function addWorkflowEmailSubscriber(workflow_id, workflow_email_id, email ) {

    return getClient().mailchimpRequest('POST', '/automations/{workflow_id}/emails/{workflow_email_id}/queue',arguments);
  }

}