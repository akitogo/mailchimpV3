/**
 * Mailchimp File Manager Files.
 *
 * Manage specific files in the File Manager for your MailChimp account. The File Manager is a place to store images, documents, and other files you include or link to in your campaigns, templates, or signup forms.
 */
component  {
	

	any function getClient() provider="mailchimp@mailchimpv3"{
	}

  /**
   * Upload a new file
   *
   * @param Integer folder_id
   *   The id of the folder.
   * @param string name
   *   The name of the file.
   * @param string file_data
   *   The base64-encoded contents of the file.
   *   File path or binary value can be passed as well
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/file-manager/files/#
   */
  public function addFile(
  	numeric folder_id
  	,string name
  	,any file_data
  	) {
  		
	// if binary we encode to base 64
	if(isBinary(file_data)){
		file_data=ToBase64(file_data);
	}
	
	// if has back or forward slash, the assume file path
	if(IsSimpleValue(file_data) 
		&& refind("[\/\\]+",file_data)
		&& fileExists(file_data)){
   		file_data=ToBase64(fileReadBinary(file_data));
	}   
		
    return getClient().mailchimpRequest('POST', '/file-manager/files', arguments);
  }

  /**
   * Get information about stored files
   *
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   * @param string count
   *   The number of records to return. 
   * @param string offset
   *   The number of records from a collection to skip. Iterating over large collections with this parameter can be slow. Default value is 0.
   * @param string type
   *   The file type for the File Manager file.
   * @param string created_by
   *   The MailChimp account user who created the File Manager file.
   * @param string before_created_at
   *   Restrict the response to files created before the set date.
   * @param string since_created_at
   *   Restrict the response to files created after the set date.
   * @param string sort_field
   *   Returns files sorted by the specified field. Possible Values: added_date
   * @param string sort_dir
   *   Determines the order direction for sorted results.

   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/file-manager/files/#
   */
  public function getFiles(
  	string fields
  	,string exclude_fields
  	,numeric count=10
  	,numeric offset=0
  	,string type
  	,string created_by
  	,string before_created_at
  	,string since_created_at
  	,string sort_field
  	,string sort_dir) {
    
    return getClient().mailchimpRequest('GET', '/file-manager/files', arguments);
  } 		

  /**
   * Get information about a specific file in the File Manager.
   *
   * @param string file_id
   *   The unique id for the File Manager file.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.

   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/file-manager/files/#
   */
  public function getFile(
  	string file_id
  	,string fields
  	,string exclude_fields
  	) {
    
    return getClient().mailchimpRequest('GET', '/file-manager/files/{file_id}', arguments);
  }  

  /**
   * Update a specific file
   *
   * @param string file_id
   *   The unique id for the File Manager file.
   * @param string folder_id
   *   The id of the folder. Setting folder_id to 0 will remove a file from its current folder.
   * @param string name
   *  The name of the file.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/file-manager/files/#
   */
  public function updateFile(
  	string file_id
  	,string folder_id
  	,string name
  	) {
    
    return getClient().mailchimpRequest('PATCH', '/file-manager/files/{file_id}', arguments);
  } 
 
   /**
   * Remove a specific file from the File Manager.
   *
   * @param string file_id
   *   The unique id for the File Manager file.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/file-manager/files/#
   */
  public function deleteFile(
  	string file_id
  	) {
    
    return getClient().mailchimpRequest('DELETE', '/file-manager/files/{file_id}', arguments);
  }   
}