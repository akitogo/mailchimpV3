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

// Conversations methods: Read

  /**
   * Get a list of conversations
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
   * @param boolean has_unread_messages
   *   Whether the conversation has any unread messages. Possible Values: true,false
   * @param string list_id
   *   The unique id for the list.
   * @param string campaign_id
   *   The unique id for the campaign.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/conversations/#read-get_conversations
   */
  public function getConversations(
    fields=''
    ,exculde_fields=''
    ,count=10
    ,offset=0
    ,has_unread_messages=false
    ,list_id
    ,campaign_id
  ) {
    return getClient().mailchimpRequest('GET', '/conversations',arguments);
  }

  /**
   * Get details about an individual conversation.
   *
   * @param string conversation_id
   *   The unique id for the conversation.
   * @param array fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param array exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/conversations/
   */
  public function getConversationById(string conversation_id,fields='',exculde_fields='',count=10,offset=0 ) {
    return getClient().mailchimpRequest('GET', '/conversations/{conversation_id}',arguments);
  }


// Conversations -> Messages methods: Read


  /**
   * Get conversation messages
   *
   * @param string conversation_id
   *   The unique id for the conversation.
   * @param array fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param array exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   * @param boolean is_read
   *   Whether a conversation message has been marked as read. Possible Values: true, false
   * @param string before_timestamp
   *   Restrict the response to messages created before the set time. We recommend ISO 8601 time format: 2015-10-21T15:41:36+00:00.
   * @param string since_timestamp
   *   Restrict the response to messages created after the set time. We recommend ISO 8601 time format: 2015-10-21T15:41:36+00:00.
   *
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/conversations/messages/#read-get_conversations_conversation_id_messages
   */
  public function getConversationMessages(
    string conversation_id
    ,fields=''
    ,exculde_fields=''
    ,is_read=true
    ,before_timestamp=''
    ,since_timestamp=''
  ) {
    return getClient().mailchimpRequest('GET', '/conversations/{conversation_id}/messages',arguments);
  }

  /**
   * Get a specific conversation message
   *
   * @param string conversation_id
   *   The unique id for the conversation.
   * @param string message_id
   *   The unique id for the conversation message.
   * @param array fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param array exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/conversations/messages/#read-get_conversations_conversation_id_messages_message_id
   */
  public function getConversationMessageById(
    required string conversation_id
    ,required string message_id
    ,fields=''
    ,exculde_fields=''
  ) {
    return getClient().mailchimpRequest('GET', '/conversations/{conversation_id}/messages/{message_id}',arguments);
  }


// Conversations -> Messages methods: Create

   /**
   * Post a new conversation message
   *
   * @param string conversation_id
   *   required The unique id for the conversation.
   * @param string from_email
   *   required A label representing the email of the sender of this message
   * @param string subject
   *   The subject of this message
   * @param string message
   *   The plain-text content of the message
   * @param boolean read
   *   required Whether this message has been marked as read
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/conversations/messages/#create-post_conversations_conversation_id_messages
   */
  public function newConversationMessage(
    required string conversation_id
    ,required string from_email
    ,string subject=''
    ,string message=''
    ,read = false) {
    return getClient().mailchimpRequest('POST', '/conversations/{conversation_id}/messages',arguments);
  }
}






