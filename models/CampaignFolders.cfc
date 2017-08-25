/**
 * Mailchimp Campaign folders.
 *
 */
component  {


	any function getClient() provider="mailchimp@mailchimpv3"{
	}

// Campaign Folders methods: Create

  /**
   * Create campaign folder
   *
   * @param string name
   *   Name to associate with the folder.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/campaign-folders/#create-post_campaign_folders
   */
  public function addCampaignFolder(string name) {
    return getClient().mailchimpRequest('POST', '/campaign-folders',arguments);
  }


// Campaign Folders methods: Read

  /**
   * Get all campaign folders
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
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/campaign-folders/#
   */
  public function getAllCampaignFolders(fields='',exculde_fields='',count=10,offset=0) {
    return getClient().mailchimpRequest('GET', '/campaign-folders',arguments);
  }

  /**
   * Get a specific campaign folder
   *
   * @param string folder_id
   *   The unique id for the campaign folder.
   * @param array fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param array exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/campaign-folders/#read-get_campaign_folders_folder_id
   */
  public function getCampaignFolder(string folder_id, fields='', exculde_fields='') {
    return getClient().mailchimpRequest('GET', '/campaign-folders/{folder_id}',arguments);
  }


// Campaign Folders methods: Edit

  /**
   * Update a campaign folder
   *
   * @param string folder_id
   *   The unique id for the campaign folder.
   * @param string name
   *   Name to associate with the folder.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/campaign-folders/#edit-patch_campaign_folders_folder_id
   */
  public function updateCampaignFolderName(string folder_id, string name) {
    return getClient().mailchimpRequest('PATCH', '/campaign-folders/{folder_id}',arguments);
  }


// Campaign Folders methods: Delete

  /**
   * Delete a campaign folder.
   *
   * @param string folder_id
   *   The ID of the folder id.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/campaign-folders/#delete-delete_campaign_folders_folder_id
   */
  public function deleteCampaignFolder(string folder_id) {
    return getClient().mailchimpRequest('DELETE', '/campaign-folders/{folder_id}',arguments);
  }

}