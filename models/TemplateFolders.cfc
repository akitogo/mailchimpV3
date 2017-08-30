/**
 * Mailchimp template folders.
 *
 */
component  {


	any function getClient() provider="mailchimp@mailchimpv3"{
	}

// Template Folders methods: Create

  /**
   * Create template folder
   *
   * @param string name
   *   required The name of the folder.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/template-folders/#create-post_template_folders
   */
  public function addFolder(required string name) {
    return getClient().mailchimpRequest('POST', '/template-folders', arguments);
  }


// Template Folders methods: Read

  /**
   * Get all template folders
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
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/template-folders/#read-get_template_folders
   */
  public function getFolders(fields='', exculde_fields='', count=10, offset=0) {
    return getClient().mailchimpRequest('GET', '/template-folders');
  }

  /**
   * Get information about a specific folder used to organize templates.
   *
   * @param string folder_id
   *   required The ID of the template.
   * @param array fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param array exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/template-folders/#read-get_template_folders_folder_id
   */
  public function getFolder(required string folder_id, fields='', exculde_fields='', count=10, offset=0 ) {
    return getClient().mailchimpRequest('GET', '/template-folders/{folder_id}',arguments);
  }


// Template Folders methods: Edit

  /**
   * Update a template folder
   *
   * @param string folder_id
   *   The unique id for the template folder.
   * @param string name
   *   The name of the folder.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/template-folders/#edit-patch_template_folders_folder_id
   */
  public function updateFolder(required string folder_id, required string name) {
    return getClient().mailchimpRequest('PATCH', '/template-folders/{folder_id}', arguments);
  }


// Template Folders methods: Delete

  /**
   * Deletes a Mailchimp template.
   *
   * @param string folder_id
   *  required The ID of the folder id.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/template-folders/#delete-delete_template_folders_folder_id
   */
  public function deleteFolder(required string folder_id) {
    return getClient().mailchimpRequest('DELETE', '/template-folders/{folder_id}',arguments);
  }

}