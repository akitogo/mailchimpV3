/**
 * Mailchimp conversations
 *
 * Conversation tracking is a paid feature that lets you view subscribers’ replies to your campaigns in your MailChimp account.
 *
 *
 */
component  {
	

	any function getClient() provider="mailchimp@mailchimpv3"{
	}


  /**
   * Get a list of conversations
   *
   * @param array parameters
   *   Associative array of optional request parameters.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/conversations/
   */
  public function getConversations(fields='',exculde_fields='',count=10,offset=0) {
    return getClient().mailchimpRequest('GET', '/conversations');
  }

  /**
   * Get details about an individual conversation.
   *
   * @param string folder_id
   *   The ID of the conversation.
   * @param array parameters
   *   Associative array of optional request parameters.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/conversations/
   */
  public function getConversation(conversation_id,fields='',exculde_fields='',count=10,offset=0 ) {

    return getClient().mailchimpRequest('GET', '/conversations/{conversation_id}',arguments);
  }


  /**
   * Get conversation messages
   *
   * @param array parameters
   *   Associative array of optional request parameters.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/conversations/messages/#
   */
  public function getConversationMessages(conversation_id,fields='',exculde_fields='') {
    return getClient().mailchimpRequest('GET', '/conversations/{conversation_id}/messages');
  }

  /**
   * Get a specific conversation message
   *
   * @param array parameters
   *   Associative array of optional request parameters.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/conversations/messages/#
   */
  public function getConversationMessage(conversation_id,message_id,fields='',exculde_fields='') {
    return getClient().mailchimpRequest('GET', '/conversations/{conversation_id}/messages/{message_id}');
  }
  
   /**
   * 	Post a new conversation message
   *
   * @param array parameters
   *   Associative array of optional request parameters.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/conversations/messages/#
   */
  public function addConversation(conversation_id,from_email,subject='',message='',read = FALSE) {
    return getClient().mailchimpRequest('POST', '/conversations/{conversation_id}/messages');
  } 
}