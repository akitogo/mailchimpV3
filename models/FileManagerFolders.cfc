/**
 * Mailchimp File Manager Folders
 *
 * Manage specific folders in the File Manager for your MailChimp account. The File Manager is a place to store images, documents, and other files you include or link to in your campaigns, templates, or signup forms.
 */
component  {


	any function getClient() provider="mailchimp@mailchimpv3"{
	}

//File Manager Folders methods: Create

  /**
   * Create a new folder in the File Manager.
   *
   * @param string name
   *   required The name of the folder.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/file-manager/folders/#create-post_file_manager_folders
   */
  public function addFolder(required string name) {
    return getClient().mailchimpRequest('POST', '/file-manager/folders', arguments);
  }


//File Manager Folders methods: Read

  /**
   * Get a list of folders in the File Manager
   *
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   * @param string count
   *   The number of records to return. Default value is 10.
   * @param string offset
   *   The number of records from a collection to skip. Iterating over large collections with this parameter can be slow. Default value is 0.
   * @param string created_by
   *   The MailChimp account user who created the File Manager file.
   * @param string before_created_at
   *   Restrict the response to files created before the set date.
   * @param string since_created_at
   *   Restrict the response to files created after the set date.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/file-manager/folders/#read-get_file_manager_folders
   */
  public function getFolders(
  	string fields
  	,string exclude_fields
  	,numeric count=10
  	,numeric offset=0
  	,string created_by
  	,string before_created_at
  	,string since_created_at
  	) {
    return getClient().mailchimpRequest('GET', '/file-manager/folders', arguments);
  }

  /**
   * Get information about a specific folder in the File Manager.
   *
   * @param string folder_id
   *   required The unique id for the File Manager file.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/file-manager/folders/#read-get_file_manager_folders_folder_id
   */
  public function getFolder(
  	required string folder_id
  	,string fields
  	,string exclude_fields
  	) {
    return getClient().mailchimpRequest('GET', '/file-manager/folders/{folder_id}', arguments);
  }


//File Manager Folders methods: Edit

  /**
   * Update a File Manager folder
   *
   * @param string folder_id
   *   The unique id for the File Manager folder.
   * @param string name
   *  The name of the folder.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/file-manager/folders/#edit-patch_file_manager_folders_folder_id
   */
  public function updateFolder(
  	required string folder_id
  	,required string name
  	) {
    return getClient().mailchimpRequest('PATCH', '/file-manager/folders/{folder_id}', arguments);
  }


//File Manager Folders methods: Delete

   /**
   * Delete a specific folder in the File Manager.
   *
   * @param string file_id
   *   required The unique id for the File Manager folder.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/file-manager/folders/#delete-delete_file_manager_folders_folder_id
   */
  public function deleteFolder(
  	required string folder_id
  	) {
    return getClient().mailchimpRequest('DELETE', '/file-manager/folders/{folder_id}', arguments);
  }
}
















