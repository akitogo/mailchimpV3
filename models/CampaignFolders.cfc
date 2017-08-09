/**
 * Mailchimp Campaign folders.
 *
 */
component  {
	

	any function getClient() provider="mailchimp@mailchimpv3"{
	}


  /**
   * Get all campaign folders
   *
   * @param array parameters
   *   Associative array of optional request parameters.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/campaign-folders/#
   */
  public function getCampaignFolders(fields='',exculde_fields='',count=10,offset=0) {
    return getClient().mailchimpRequest('GET', '/campaign-folders');
  }

  /**
   * Get a specific campaign folder
   *
   * @param string folder_id
   *   The ID of the campaign.
   * @param array parameters
   *   Associative array of optional request parameters.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/campaign-folders/#
   */
  public function getCampaignFolder(fields='',exculde_fields='',count=10,offset=0 ) {

    return getClient().mailchimpRequest('GET', '/campaign-folders/{folder_id}',arguments);
  }

  /**
   * 	Create campaign folder
   *
   * @param string name
   *   Name to associate with the folder.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/campaign-folders/#
   */
  public function addCampaignFolder(name) {

    return getClient().mailchimpRequest('POST', '/campaign-folders',arguments, batch);
  }


  /**
   * Update a campaign folder
   *
   * @param string name
   *   Name to associate with the folder.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/campaign-folders/#
   */
  public function updateCampaign(name) {

    return getClient().mailchimpRequest('PATCH', '/campaign-folders/{folder_id}',arguments, batch);
  }


  /**
   * Deletes a Mailchimp campaign.
   *
   * @param string folder_id	
   *   The ID of the folder id.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/campaign-folders/#
   */
  public function delete(folder_id	) {

    return getClient().mailchimpRequest('DELETE', '/campaign-folders/{folder_id}',arguments);
  }

}