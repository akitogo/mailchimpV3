/**
 * Mailchimp Templates library.
 *
 */
component  {
	

	any function getClient() provider="mailchimp@mailchimpv3"{
	}

  /**
   * Gets information about all templates owned by the authenticated account.
   *
   * @param array arguments
   *   Associative array of optional request parameters.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/templates/#read-get_templates
   */
  public function getTemplates() {
    return getClient().mailchimpRequest('GET', '/templates', arguments);
  }

  /**
   * Gets information a specific template.
   *
   * @param string template_id
   *   The ID of the template.
   * @param array arguments
   *   Associative array of optional request parameters.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/templates/#read-get_templates_template_id
   */
  public function getTemplate(template_id ) {

    return getClient().mailchimpRequest('GET', '/templates/{template_id}',  arguments);
  }

  /**
   * Gets the default content of a specific template.
   *
   * @param string template_id
   *   The ID of the template.
   * @param array arguments
   *   Associative array of optional request parameters.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/templates/default-content/#read-get_templates_template_id_default_content
   */
  public function getTemplateContent(template_id ) {

    return getClient().mailchimpRequest('GET', '/templates/{template_id}/default-content',  arguments);
  }

}