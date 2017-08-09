/**
 * Mailchimp template folders.
 *
 */
component  {
	

	any function getClient() provider="mailchimp@mailchimpv3"{
	}


  /**
   * Get all template folders
   *
   * @param array parameters
   *   Associative array of optional request parameters.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/template-folders/#
   */
  public function getTemplateFolders(fields='',exculde_fields='',count=10,offset=0) {
    return getClient().mailchimpRequest('GET', '/template-folders');
  }

  /**
   * Get a specific template folder
   *
   * @param string folder_id
   *   The ID of the template.
   * @param array parameters
   *   Associative array of optional request parameters.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/template-folders/#
   */
  public function getTemplateFolder(fields='',exculde_fields='',count=10,offset=0 ) {

    return getClient().mailchimpRequest('GET', '/template-folders/{folder_id}',arguments);
  }

  /**
   * 	Create template folder
   *
   * @param string name
   *   Name to associate with the folder.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/template-folders/#
   */
  public function addtemplateFolder(name) {

    return getClient().mailchimpRequest('POST', '/template-folders',arguments, batch);
  }


  /**
   * Update a template folder
   *
   * @param string name
   *   Name to associate with the folder.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/template-folders/#
   */
  public function updatetemplate(name) {

    return getClient().mailchimpRequest('PATCH', '/template-folders/{folder_id}',arguments, batch);
  }


  /**
   * Deletes a Mailchimp template.
   *
   * @param string folder_id	
   *   The ID of the folder id.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/template-folders/#
   */
  public function delete(folder_id	) {

    return getClient().mailchimpRequest('DELETE', '/template-folders/{folder_id}',arguments);
  }

}