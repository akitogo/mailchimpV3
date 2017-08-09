/**
 * Manage interest categories for a specific list. Interest categories organize interests, 
 * which are used to group subscribers based on their preferences. These correspond to 
 * ‘group titles’ in the MailChimp application. 
 *
 */
component  {

	any function getClient() provider="mailchimp@mailchimpv3"{
	}

  /**
   * Create a new interest category
   *
   * @param string list_id
   *   The ID of the list.
   * @param string title
   *   The text description of this category. This field appears on signup forms and is often phrased as a question.
   * @param Integer display_order
   *   The order that the categories are displayed in the list. Lower numbers display first.
   * @param string type
   *   Determines how this category’s interests appear on signup forms.   
   *   Possible Values: checkboxes dropdown radio hidden      
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/interest-categories/#
   */
  public function addInterestCategories(
  	string list_id
  	,string title
  	,display_order=0
  	,string type
  	) {

    return getClient().mailchimpRequest('POST', '/lists/{list_id}/interest-categories', arguments);
  }

  /**
   * Delete a specific interest category
   *
   * @param string list_id
   *   The ID of the list.
   * @param string interest_category_id
   *   The ID of the interest category.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/interest-categories/#
   */
  public function deleteInterestCategories(
  	string list_id
  	,string title
  	,display_order=0
  	,string type
  	) {

    return getClient().mailchimpRequest('POST', '/lists/{list_id}/interest-categories/{interest_category_id}', arguments);
  }
  /**
   * Update a specific interest category.
   *
   * @param string list_id
   *   The ID of the list.
   * @param string interest_category_id
   *   The ID of the interest category.
   * @param string title
   *   The text description of this category. This field appears on signup forms and is often phrased as a question.
   * @param Integer display_order
   *   The order that the categories are displayed in the list. Lower numbers display first.
   * @param string type
   *   Determines how this category’s interests appear on signup forms.   
   *   Possible Values: checkboxes dropdown radio hidden      
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/interest-categories/#
   */
  public function updateInterestCategories(
  	string list_id
  	,string interest_category_id
  	,string title
  	,display_order=0
  	,string type
  	) {

    return getClient().mailchimpRequest('PATCH', '/lists/{list_id}/interest-categories/{interest_category_id}', arguments);
  }
  
  /**
   * Gets information about all interest categories associated with a list.
   *
   * @param string list_id
   *   The ID of the list.
   * @param array parameters
   *   Associative array of optional request parameters.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/interest-categories/#read-get_lists_list_id_interest_categories
   */
  public function getInterestCategories(list_id) {

    return getClient().mailchimpRequest('GET', '/lists/{list_id}/interest-categories', arguments);
  }

// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Subresources
// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// INTERESTS
// Manage interests for a specific MailChimp list. Assign subscribers to interests to group them together. Interests are referred to as ‘group names’ in the MailChimp application.

  /**
   * Create a new interest or ‘group name’ for a specific category.
   *
   * @param string list_id
   *   The ID of the list.
   * @param string title
   *   The text description of this category. This field appears on signup forms and is often phrased as a question.
   * @param Integer display_order
   *   The order that the categories are displayed in the list. Lower numbers display first.
   * @param string type
   *   Determines how this category’s interests appear on signup forms.   
   *   Possible Values: checkboxes dropdown radio hidden      
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/interest-categories/#
   */
  public function addInterestCategoriesInterests(
  	string list_id
  	,string interest_category_id
  	,string name
  	,numeric display_order=0
  	) {

    return getClient().mailchimpRequest('POST', ' /lists/{list_id}/interest-categories/{interest_category_id}/interests', arguments);
  }



  /**
   * Gets information about all interests associated with an interest category.
   *
   * @param string list_id
   *   The ID of the list.
   * @param string interest_category_id
   *   The ID of the interest category.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/interest-categories/interests/#read-get_lists_list_id_interest_categories_interest_category_id_interests
   */
  public function getInterests(list_id, interest_category_id,fields,exclude_fields) {

    return getClient().mailchimpRequest('GET', '/lists/{list_id}/interest-categories/{interest_category_id}/interests', arguments);
  }

  /**
   * Get interests in a specific category
   *
   * @param string list_id
   *   The ID of the list.
   * @param string interest_category_id
   *   The ID of the interest category.
   * @param string interest_id
   *   The specific interest or ‘group name’.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/interest-categories/interests/#read-get_lists_list_id_interest_categories_interest_category_id_interests
   */
  public function getInterestsInCategory(list_id
 	 ,interest_category_id
 	 ,interest_id
 	 ,fields,exclude_fields) {

    return getClient().mailchimpRequest('GET', '/lists/{list_id}/interest-categories/{interest_category_id}/interests/{interest_id}', arguments);
  }

  /**
   * Updates interests in a specific category
   *
   * @param string list_id
   *   The ID of the list.
   * @param string interest_category_id
   *   The ID of the interest category.
   * @param string interest_id
   *   The specific interest or ‘group name’.
   * @param string name
   *   The name of the interest. This can be shown publicly on a subscription form.
   * @param string display_order
   *   The display order for interests.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/interest-categories/interests/#read-get_lists_list_id_interest_categories_interest_category_id_interests
   */
  public function updateInterestsInCategory(
  	 list_id
 	 ,interest_category_id
 	 ,interest_id
 	 ,name
 	 ,display_order) {

    return getClient().mailchimpRequest('PATCH', '/lists/{list_id}/interest-categories/{interest_category_id}/interests/{interest_id}', arguments);
  }

  /**
   * Deletes interests in a specific category
   *
   * @param string list_id
   *   The ID of the list.
   * @param string interest_category_id
   *   The ID of the interest category.
   * @param string interest_id
   *   The specific interest or ‘group name’.
   *
   * @return struct
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/lists/interest-categories/interests/#read-get_lists_list_id_interest_categories_interest_category_id_interests
   */
  public function deleteInterestsInCategory(
  	 list_id
 	 ,interest_category_id
 	 ,interest_id
 	 ) {

    return getClient().mailchimpRequest('DELETE', '/lists/{list_id}/interest-categories/{interest_category_id}/interests/{interest_id}', arguments);
  }  
}