/**
 * Mailchimp Templates library.
 *
 */
component  {


	any function getClient() provider="mailchimp@mailchimpv3"{
	}


// Templates methods: Read

  /**
   * Gets information about all templates owned by the authenticated account.
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
   * @param string created_by
   *   The MailChimp account user who created the template.
   * @param string since_created_at
   *   Restrict the response to templates created after the set date.
   * @param string before_created_at
   *   Restrict the response to templates created before the set date.
   * @param string type
   *   Limit results based on template type.
   * @param string folder_id
   *   The unique folder id.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/templates/#read-get_templates
   */
  public function getTemplates(
    fields=''
    ,exculde_fields=''
    ,count=10
    ,offset=0
    ,created_by
    ,since_created_at
    ,before_created_at
    ,type
    ,folder_id
  ) {
    return getClient().mailchimpRequest('GET', '/templates', arguments);
  }


 /**
   * Gets information a specific template.
   *
   * @param string template_id
   *   The ID of the template.
   * @param array fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param array exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/templates/#read-get_templates_template_id
   */
  public function getTemplate(string template_id, fields='', exculde_fields='' ) {

    return getClient().mailchimpRequest('GET', '/templates/{template_id}', arguments);
  }


// Templates methods: Create

/**
   * Creates a new template
   *
   * @param required string name
   *   The name of the template.
   * @param string folder_id
   *   The id of the folder the template is currently in.
   * @param string html
   *   The raw HTML for the template. We support the MailChimp Template Language in any HTML code passed via the API.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/templates/#create-post_templates
   */
  public function createTemplate(string name, folder_id='', html='' ) {
    return getClient().mailchimpRequest('POST', '/templates', arguments);
  }


// Templates methods: Edit

/**
   * Updates the name, HTML, or folder_id of an existing template.
   *
   * @param string template_id
   *   required The ID of the template.
   * @param required string name
   *   required The name of the template.
   * @param string folder_id
   *   The id of the folder the template is currently in.
   * @param string html
   *   required The raw HTML for the template. We support the MailChimp Template Language in any HTML code passed via the API.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/templates/#edit-patch_templates_template_id
   */
  public function editTemplate(string template_id, string name, folder_id='', string html ) {
    return getClient().mailchimpRequest('PATCH', '/templates/{template_id}', arguments);
  }


// Templates methods: Delete

/**
   * Deletes a specific template.
   *
   * @param string template_id
   *   required The ID of the template.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/templates/#delete-delete_templates_template_id
   */
  public function deleteTemplate(string template_id) {
    return getClient().mailchimpRequest('DELETE', '/templates/{template_id}', arguments);
  }




// Templates -> Default Content methods: Read

  /**
   * Gets the default content of a specific template.
   *
   * @param string template_id
   *   The ID of the template.
   * @param array fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param array exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/templates/default-content/#read-get_templates_template_id_default_content
   */
  public function getTemplateContent(template_id, fields='', exculde_fields='') {

    return getClient().mailchimpRequest('GET', '/templates/{template_id}/default-content',  arguments);
  }

}