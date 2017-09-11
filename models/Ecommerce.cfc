/**
 * Mailchimp Ecommerce library.
 *
 * @package Mailchimp
 */
component  {


	any function getClient() provider="mailchimp@mailchimpv3"{
	}
  /**
   * Gets information about all stores in the account.
   *
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   * @param numeric count
   *   The number of records to return. Default value is 10.
   * @param numeric offset
   *   The number of records from a collection to skip. Iterating over large collections with this parameter can be slow. Default value is 0.
   *
   * @return struct
   *   The API store response object.
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/#read-get_ecommerce_stores
   */
  public function getStores() {
    return getClient().mailchimpRequest('GET', '/ecommerce/stores',arguments);
  }

  /**
   * Gets information about a specific store.
   *
   * @param string store_id
   *   The ID of the store.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *   The API store response object.
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/#read-get_ecommerce_stores_store_id
   */
  public function getStore(store_id ) {

    return getClient().mailchimpRequest('GET', '/ecommerce/stores/{store_id}', arguments);
  }

  /**
   * Adds a new store to the authenticated account.
   *
   * @param string id
   *   A unique identifier for the store.
   * @param string list_id
   *   The unique identifier for the MailChimp List associated with the store. The list_id for a specific store cannot change.
   * @param string name
   *   The name of the store
   * @param string currency_code
   *   The three-letter ISO 4217 code for the currency that the store accepts.
   *
   *   Optional parameters:
   * @param string platform
   *   The e-commerce platform of the store.
   * @param string domain
   *   The store domain.
   * @param boolean is_syncing
   *   Whether the e-commerce store is currently syncing.
   * @param string email_adress
   *   The email address for the store.
   * @param string money_format
   *   The currency format for the store. For example: $, £, etc.
   * @param string primary_locale
   *   The primary locale for the store. For example: en, de, etc.
   * @param string timezone
   *   The timezone for the store.
   * @param string phone
   *   The store phone number.
   * @param struct address
   *   address has following elements:
   *   strings address1,address2,city,province,province_code,postal_code,country,
   *   country_code, numeric longitude, numeric latitude
   *
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   *   The API store response object.
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/#create-post_ecommerce_stores
   */
  public function addStore(id, list_id, name, currency_code, batch = FALSE) {

    return getClient().mailchimpRequest('POST', '/ecommerce/stores',arguments, batch);
  }

  /**
   * Updates a store.
   *
   * @param string store_id
   *   A unique identifier for the store.
   *
   *   Optional parameters:
   * @param string name
   *   The name of the store
   * @param string currency_code
   *   The three-letter ISO 4217 code for the currency that the store accepts.
   * @param string platform
   *   The e-commerce platform of the store.
   * @param string domain
   *   The store domain.
   * @param boolean is_syncing
   *   Whether the e-commerce store is currently syncing.
   * @param string email_adress
   *   The email address for the store.
   * @param string money_format
   *   The currency format for the store. For example: $, £, etc.
   * @param string primary_locale
   *   The primary locale for the store. For example: en, de, etc.
   * @param string timezone
   *   The timezone for the store.
   * @param string phone
   *   The store phone number.
   * @param struct address
   *   address has following elements:
   *   strings address1,address2,city,province,province_code,postal_code,country,
   *   country_code, numeric longitude, numeric latitude
   *
   * @return struct
   *   The API store response object.
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/#edit-patch_ecommerce_stores_store_id
   */
  public function updateStore(store_id, batch = FALSE) {
    return getClient().mailchimpRequest('PATCH', '/ecommerce/stores/{store_id}', arguments, batch);
  }

  /**
   * Deletes a Mailchimp store.
   *
   * @param string store_id
   *   The ID of the store.
   *
   * @return struct
   *   The API store response object.
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/#delete-delete_ecommerce_stores_store_id
   */
  public function deleteStore(store_id) {

    return getClient().mailchimpRequest('DELETE', '/ecommerce/stores/{store_id}', arguments);
  }




  /**
   * Get information about a store’s carts.
   *
   * @param array store_id
   *   The ID of the store where the carts exist.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   * @param numeric count
   *   The number of records to return. Default value is 10.
   * @param numeric offset
   *   The number of records from a collection to skip. Iterating over large collections with this parameter can be slow. Default value is 0.
   *
   * @return struct
   *   The API cart response object.
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/carts/#read-get_ecommerce_stores_store_id_carts
   */
  public function getCarts(store_id ) {

    return getClient().mailchimpRequest('GET', '/ecommerce/stores/{store_id}/carts', arguments);
  }

  /**
   * Get information about a specific cart.
   *
   * @param string store_id
   *   The ID of the store.
   * @param string cart_id
   *   The ID of the cart.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *   The API cart response object.
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/carts/#read-get_ecommerce_stores_store_id_carts_cart_id
   */
  public function getCart(store_id, cart_id ) {

    return getClient().mailchimpRequest('GET', '/ecommerce/stores/{store_id}/carts/{cart_id}', arguments);
  }

  /**
   * Adds a new cart to a store.
   *
   * @param string store_id
   *   The unique identifier for the store.
   * @param string id
   *   The unique identifier for the cart.
   * @param struct customer
   *   Elements of customer:
   * @param string company
   *   The customer’s company.
   * @param string first_name
   *   The customer’s first name.
   * @param string last_name
   *   The customer’s last name.
   * @param numeric orders_count
   *   The customer’s total order count. Learn More about using this data.
   * @param numeric total_spent
   *   The total amount the customer has spent.
   * @param struct address
   *   The customer’s address.
   *   Address has following parameters:
   *   address1, address2, city, province, province_code, postal_code, country, country_code
   *
   * @param string campaign_id
   *   A string that uniquely identifies the campaign for a cart.
   * @param string checkout_url
   *   The URL for the cart. This parameter is required for Abandoned Cart automations.
   * @param string currency_code
   *   The three-letter ISO 4217 code for the currency that the cart uses.
   * @param numeric order_total
   *   The order total for the cart.
   * @param numeric tax_total
   *   The total tax for the cart.
   * @param struct lines
   *   A struct of the cart’s line items.
   *   Lines has following elements:
   * @param string id
   * @param string product_id
   * @param string product_variant_id
   * @param numeric quantity
   * @param numeric price
   *
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   *   The API cart response object.
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/carts/#create-post_ecommerce_stores_store_id_carts
   */
  public function addCart(store_id, id, customer,currency_code,order_total, lines, batch = FALSE) {

    return getClient().mailchimpRequest('POST', '/ecommerce/stores/{store_id}/carts', arguments, batch);
  }

  /**
   * Updates a specific cart.
   *
   * @param string store_id
   *   The unique identifier for the store.
   * @param string cart_id
   *   The unique identifier for the cart.
   * Optional parameters are:
   *   - struct customer
   *   - string campaign_id
   *   - string checkout_url
   *   - string currency_code
   *   - string order_total
   *   - string tax_total
   *   - array lines
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   *   The API cart response object.
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/carts/#edit-patch_ecommerce_stores_store_id_carts_cart_id
   */
  public function updateCart(store_id, cart_id, batch = FALSE) {

    return getClient().mailchimpRequest('PATCH', '/ecommerce/stores/{store_id}/carts/{cart_id}', arguments, batch);
  }

  /**
   * Deletes a cart.
   *
   * @param string store_id
   *   The ID of the store.
   * @param string cart_id
   *   The ID of the cart.
   *
   * @return struct
   *   The API cart response object.
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/carts/#delete-delete_ecommerce_stores_store_id_carts_cart_id
   */
  public function deleteCart(store_id, cart_id) {

    return getClient().mailchimpRequest('DELETE', '/ecommerce/stores/{store_id}/carts/{cart_id}');
  }

  /**
   * Get information about a cart's line items.
   *
   * @param string store_id
   *   The unique identifier for the store.
   * @param string cart_id
   *   The unique identifier for the cart.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   * @param numeric count
   *   The number of records to return. Default value is 10.
   * @param numeric offset
   *   The number of records from a collection to skip. Iterating over large collections with this parameter can be slow. Default value is 0.
   *
   * @return struct
   *   The API cart line response object.
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/carts/lines/#read-get_ecommerce_stores_store_id_carts_cart_id_lines
   */
  public function getCartLines(store_id, cart_id ) {

    return getClient().mailchimpRequest('GET', '/ecommerce/stores/{store_id}/carts/{cart_id}/lines', arguments);
  }

  /**
   * Get information about a specific cart line item.
   *
   * @param string store_id
   *   The unique identifier for the store.
   * @param string cart_id
   *   The unique identifier for the cart.
   * @param string line_id
   *   The unique identifier for the line item of a cart.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *   The API cart line response object.
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/carts/lines/#read-get_ecommerce_stores_store_id_carts_cart_id_lines_line_id
   */
  public function getCartLine(store_id, cart_id, line_id ) {

    return getClient().mailchimpRequest('GET', '/ecommerce/stores/{store_id}/carts/{cart_id}/lines/{line_id}', arguments);
  }

  /**
   * Add a new line item to an existing cart.
   *
   * @param string store_id
   *   The unique identifier for the store.
   * @param string cart_id
   *   The unique identifier for the cart.
   * @param string id
   *   A unique identifier for the order line item.
   * @param string product_id
   *   A unique identifier for the product associated with the cart line item.
   * @param string product_variant_id
   *   A unique identifier for the product variant associated with the cart line item.
   * @param numeric quantity
   *   The quantity of a cart line item.
   * @param numeric price
   *   The price of a cart line item.
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   *   The API cart line response object.
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/carts/lines/#create-post_ecommerce_stores_store_id_carts_cart_id_lines
   */
  public function addCartLine(store_id, cart_id, id, product_id, product_variant_id, quantity, price, batch = FALSE) {

    return getClient().mailchimpRequest('POST', '/ecommerce/stores/{store_id}/carts/{cart_id}/lines', arguments, batch);
  }

  /**
   * Updates an existing line item in a cart.
   *
   * @param string store_id
   *   The unique identifier for the store.
   * @param string cart_id
   *   The unique identifier for the cart.
   * @param string line_id
   *   A unique identifier for the order line item.
   * @param string product_id
   *   A unique identifier for the product associated with the cart line item.
   * @param string product_variant_id
   *   A unique identifier for the product variant associated with the cart line item.
   * @param numeric quantity
   *   The quantity of a cart line item.
   * @param numeric price
   *   The price of a cart line item.
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   *   The API cart line response object.
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/carts/lines/#edit-patch_ecommerce_stores_store_id_carts_cart_id_lines_line_id
   */
  public function updateCartLine(store_id, cart_id, line_id, batch = FALSE) {

    return getClient().mailchimpRequest('PATCH', '/ecommerce/stores/{store_id}/carts/{cart_id}/lines/{line_id}', arguments, batch);
  }

  /**
   * Deletes a line item in a cart.
   *
   * @param string store_id
   *   The unique identifier for the store.
   * @param string cart_id
   *   The unique identifier for the cart.
   * @param string line_id
   *   A unique identifier for the order line item.
   *
   * @return struct
   *   The API cart line response object.
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/carts/lines/#delete-delete_ecommerce_stores_store_id_carts_cart_id_lines_line_id
   */
  public function deleteCartLine(store_id, cart_id, line_id) {
    return getClient().mailchimpRequest('DELETE', '/ecommerce/stores/{store_id}/carts/{cart_id}/lines/{line_id}');
  }

  /**
   * Get information about a store's customers.
   *
   * @param string store_id
   *   The ID of the store.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   * @param numeric count
   *   The number of records to return. Default value is 10.
   * @param numeric offset
   *   The number of records from a collection to skip. Iterating over large collections with this parameter can be slow. Default value is 0.
   * @param string email_address
   *   Restrict the response to customers with the email address.
   *
   * @return struct
   *   The API customer response object.
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/customers/#read-get_ecommerce_stores_store_id_customers
   */
  public function getCustomers(store_id ) {

    return getClient().mailchimpRequest('GET', '/ecommerce/stores/{store_id}/customers', arguments);
  }

  /**
   * Get information about a specific customer.
   *
   * @param string store_id
   *   The ID of the store.
   * @param string customer_id
   *   The ID of the customer.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *   The API customer response object.
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/customers/#read-get_ecommerce_stores_store_id_customers_customer_id
   */
  public function getCustomer(store_id, customer_id ) {

    return getClient().mailchimpRequest('GET', '/ecommerce/stores/{store_id}/customers/{customer_id}', arguments);
  }

  /**
   * Adds a new customer to a store.
   *
   * @param string store_id
   *   The ID of the store.
   * @param array customer
   *   An associative array of customer information.
   *   - id (string) A unique identifier for the customer.
   *   - email_address (string) The customer's email address.
   *   - opt_in_status (boolean) The customer's opt-in status. This value will
   *     never overwrite the opt-in status of a pre-existing MailChimp list
   *     member, but will apply to list members that are added through the
   *     e-commerce API endpoints.
   *
   *   Optional parameters:
   * @param string company
   *   The customer’s company.
   * @param string first_name
   *   The customer’s first name.
   * @param string last_name
   *   The customer’s last name.
   * @param numeric orders_count
   *   The customer’s total order count. Learn More about using this data.
   * @param numeric total_spent
   *   The total amount the customer has spent.
   * @param struct address
   *   The customer’s address.
   *   Address has following parameters:
   *   address1, address2, city, province, province_code, postal_code, country, country_code
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   *   The API customer response object.
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/customers/#create-post_ecommerce_stores_store_id_customers
   */
  public function addCustomer(store_id, id, email_address, opt_in_status, batch = FALSE) {
    return getClient().mailchimpRequest('POST', '/ecommerce/stores/{store_id}/customers',  arguments, batch);
  }

  /**
   * Update a customer.
   *
   * @param string store_id
   *   The ID of the store.
   * @param string customer_id
   *   The id for the customer of a store.
   *  @param string company
   *   The customer’s company.
   * @param string first_name
   *   The customer’s first name.
   * @param string last_name
   *   The customer’s last name.
   * @param numeric orders_count
   *   The customer’s total order count. Learn More about using this data.
   * @param numeric total_spent
   *   The total amount the customer has spent.
   * @param struct address
   *   The customer’s address.
   *   Address has following parameters:
   *   address1, address2, city, province, province_code, postal_code, country, country_code
   *
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   *   The API customer response object.
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/customers/#edit-patch_ecommerce_stores_store_id_customers_customer_id
   */
  public function updateCustomer(store_id, customer_id, batch = FALSE) {

    return getClient().mailchimpRequest('PATCH', '/ecommerce/stores/{store_id}/customers/{customer_id}',  arguments, batch);
  }

  /**
   * Deletes a customer from a store.
   *
   * @param string store_id
   *   The ID of the store.
   * @param string customer_id
   *   The ID of the customer.
   *
   * @return struct
   *   The API customer response object.
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/customers/#delete-delete_ecommerce_stores_store_id_customers_customer_id
   */
  public function deleteCustomer(store_id, customer_id) {

    return getClient().mailchimpRequest('DELETE', '/ecommerce/stores/{store_id}/customers/{customer_id}', arguments);
  }

  /**
   * Get information about a store's orders.
   *
   * @param string store_id
   *   The ID of the store.
   * @param  string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   * @param numeric count
   *   The number of records to return. Default value is 10.
   * @param numeric offset
   *   The number of records from a collection to skip. Iterating over large collections with this parameter can be slow. Default value is 0.
   * @param string customer_id
   *   Restrict results to orders made by a specific customer.
   * @param string campaign_id
   *   Restrict results to orders with a specific campaign_id value.
   *
   * @return struct
   *   The API order response object.
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/orders/#read-get_ecommerce_stores_store_id_orders
   */
  public function getOrders(store_id ) {

    return getClient().mailchimpRequest('GET', '/ecommerce/stores/{store_id}/orders', arguments);
  }

  /**
   * Get information about a specific order.
   *
   * @param string store_id
   *   The ID of the store.
   * @param string order_id
   *   The ID of the order.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *   The API order response object.
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/orders/#read-get_ecommerce_stores_store_id_orders_order_id
   */
  public function getOrder(store_id, order_id ) {

    return getClient().mailchimpRequest('GET', '/ecommerce/stores/{store_id}/orders/{order_id}' , arguments);
  }

  /**
   * Add a new order to a store.
   *
   * @param string store_id
   *   The ID of the store.
   * @param string id
   *   A unique identifier for the order.
   * @param object customer
   *   Associative array of customer information.
   *   - id (string): A unique identifier for the customer.
   *   - email_address (string) The customer’s email address.
   *   - opt_in_status (boolean) The customer’s opt-in status. This value will never overwrite the opt-in status of a pre-existing MailChimp list member,
   *    but will apply to list members that are added through the e-commerce API endpoints.
   *    Customers who don’t opt in to your MailChimp list will be added as Transactional members.
   *   - company (string) The customer’s company.
   *   - first_name (string) The customer’s first name.
   *   - last_name (string) The customer’s last name.
   *   - orders_count (numeric) The customer’s total order count. Learn More about using this data.
   *   - total_spent (numeric) The total amount the customer has spent. Learn More about using this data.
   *   - address (struct) The customer’s address. (strings address1,address2,city,province,province_code,postal_code,country,country_code)
   * @param string campaign_id
   *   A string that uniquely identifies the campaign for an order.
   * @param string landing_site
   *   The URL for the page where the buyer landed when entering the shop.
   * @param string financial_status
   *   The order status. Use this parameter to trigger Order Notifications.
   * @param string fulfillment_status
   *   The fulfillment status for the order. Use this parameter to trigger Order Notifications.
   * @param string currency_code
   *   The three-letter ISO 4217 code for the currency that the store accepts.
   * @param numeric order_total
   *   The total for the order.
   * @param string order_url
   *   The URL for the order.
   * @param numeric discount_total
   *   The total amount of the discounts to be applied to the price of the order.
   * @param numeric tax_total
   *   The tax total for the order.
   * @param numeric shipping_total
   *   The shipping total for the order.
   * @param string tracking_code
   *   The MailChimp tracking code for the order. Uses the ‘mc_tc’ parameter in E-Commerce tracking URLs.
   *   possible values: prec
   * @param string processed_at_foreign
   *   The date and time the order was processed.
   * @param string cancelled_at_foreign
   *   The date and time the order was cancelled.
   * @param string updated_at_foreign
   *   The date and time the order was updated.
   * @param struct shipping_address
   *   The shipping address for the order. (name,address1,address2,city,province,province_code,postal_code,country,country_code,longitude,latitude,phone,company)
   * @param struct billing_address
   *   The billing address for the order. (name,address1,address2,city,province,province_code,postal_code,country,country_code,longitude,latitude,phone,company)
   * @param array lines
   *   An array of the order’s line items. (id,product_id,product_variant_id,quantity,price,discount)
   *
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   *   The API order response object.
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/orders/#create-post_ecommerce_stores_store_id_orders
   */
  public function addOrder(store_id, id,customer, currency_code, order_total, lines, batch = FALSE) {

    return getClient().mailchimpRequest('POST', '/ecommerce/stores/{store_id}/orders', arguments, batch);
  }

  /**
   * Update a specific order.
   *
   * @param string store_id
   *   The ID of the store.
   * @param string order_id
   *   The ID for the order in the store.
   * @param array parameters
   *   An array of optional parameters. See function addOrder()
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   *   The API order response object.
   *
   * @throws \Mailchimp\MailchimpAPIException
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/orders/#edit-patch_ecommerce_stores_store_id_orders_order_id
   */
  public function updateOrder(store_id, order_id,  batch = FALSE) {

    return getClient().mailchimpRequest('PATCH', '/ecommerce/stores/{store_id}/orders/{order_id}', arguments, batch);
  }

  /**
   * Deletes an order.
   *
   * @param string store_id
   *   The ID of the store.
   * @param string order_id
   *   The ID for the order in a store.
   *
   * @return struct
   *   The API order response object.
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/orders/#delete-delete_ecommerce_stores_store_id_orders_order_id
   */
  public function deleteOrder(store_id, order_id) {

    return getClient().mailchimpRequest('DELETE', '/ecommerce/stores/{store_id}/orders/{order_id}');
  }

  /**
   * Get information about an order's line items.
   *
   * @param string store_id
   *   The ID of the store.
   * @param string order_id
   *   The ID of the order.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   * @param numeric count
   *   The number of records to return. Default value is 10.
   * @param numeric offset
   *   The number of records from a collection to skip. Iterating over large collections with this parameter can be slow. Default value is 0.
   *
   * @return struct
   *   The API order line response object.
   *
   * @throws \Mailchimp\MailchimpAPIException
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/orders/lines/#read-get_ecommerce_stores_store_id_orders_order_id_lines
   */
  public function getOrderLines(store_id, order_id ) {

    return getClient().mailchimpRequest('GET', '/ecommerce/stores/{store_id}/orders/{order_id}/lines', arguments);
  }

  /**
   * Get information about a specific order line item.
   *
   * @param string store_id
   *   The ID of the store.
   * @param string order_id
   *   The ID of the order.
   * @param string line_id
   *   The ID for the line item of an order.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *   The API order line response object.
   *
   * @throws \Mailchimp\MailchimpAPIException
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/orders/lines/#read-get_ecommerce_stores_store_id_orders_order_id_lines_line_id
   */
  public function getOrderLine(store_id, order_id, line_id ) {

    return getClient().mailchimpRequest('GET', '/ecommerce/stores/{store_id}/orders/{order_id}/lines/{line_id}', arguments);
  }

   /**
   * Update a specific order line item.
   *
   * @param string store_id
   *   The ID of the store.
   * @param string order_id
   *   The ID of the order.
   * @param string line_id
   *   The ID for the line item of an order.
   * @param string product_id
   *   A unique identifier for the product associated with the order line item.
   * @param string product_variant_id
   *   A unique identifier for the product variant associated with the order line item.
   * @param numeric quantity
   *   The quantity of an order line item.
   * @param numeric price
   *   The price of an order line item.
   * @param numeric discount
   *   The total discount amount applied to this line item.
   *
   * @return struct
   *   The API order line response object.
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/orders/lines/#edit-patch_ecommerce_stores_store_id_orders_order_id_lines_line_id
   */
  public function updateOrderLine(store_id, order_id, line_id ) {

    return getClient().mailchimpRequest('PATCH', '/ecommerce/stores/{store_id}/orders/{order_id}/lines/{line_id}', arguments);
  }

   /**
   * Delete a specific order line item.
   *
   * @param string store_id
   *   The ID of the store.
   * @param string order_id
   *   The ID of the order.
   * @param string line_id
   *   The ID for the line item of an order.
   *
   * @return struct
   *   The API order line response object.
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/orders/lines/#delete-delete_ecommerce_stores_store_id_orders_order_id_lines_line_id
   */
  public function deleteOrderLine(store_id, order_id, line_id ) {

    return getClient().mailchimpRequest('DELETE', '/ecommerce/stores/{store_id}/orders/{order_id}/lines/{line_id}', arguments);
  }

  /**
   * Add a new line item to an existing order.
   *
   * @param string store_id
   *   The ID of the store.
   * @param string order_id
   *   The ID for the order in a store.
   * @param string id
   *   A unique identifier for the order line item.
   * @param array product
   *   Associative array of product information.
   *   - product_id (string) The unique identifier for the product.
   *   - product_variant_id (string) The unique id for the product variant.
   *   - quantity (int) The quantity of a cart line item.
   *   - price (float) The price of a cart line item.
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   *   The API order line response object.
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/orders/lines/#create-post_ecommerce_stores_store_id_orders_order_id_lines
   */
  public function addOrderLine(store_id, order_id, id, product, batch = FALSE) {

    return getClient().mailchimpRequest('POST', '/ecommerce/stores/{store_id}/orders/{order_id}/lines', arguments, batch);
  }

  /**
   * Get information about all products for a store.
   *
   * @param string store_id
   *   The store id.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   * @param numeric count
   *   The number of records to return. Default value is 10.
   * @param numeric offset
   *   The number of records from a collection to skip. Iterating over large collections with this parameter can be slow. Default value is 0.
   *
   *
   * @return struct
   *   The API product response object.
   *
   * @throws \Mailchimp\MailchimpAPIException
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/products/#read-get_ecommerce_stores_store_id_products
   */
  public function getProducts(store_id ) {

    return getClient().mailchimpRequest('GET', '/ecommerce/stores/{store_id}/products', arguments);
  }

  /**
   * Get information about a specific product.
   *
   * @param string store_id
   *   The store id.
   * @param string product_id
   *   The id for the product of a store.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *   The API product response object.
   *
   * @throws \Mailchimp\MailchimpAPIException
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/products/#read-get_ecommerce_stores_store_id_products_product_id
   */
  public function getProduct(store_id, product_id ) {

    return getClient().mailchimpRequest('GET', '/ecommerce/stores/{store_id}/products/{product_id}', arguments);
  }

  /**
   * Add a product to a store.
   *
   * @param string store_id
   *   The store id.
   * @param string id
   *   A unique identifier for the product.
   * @param string title
   *   The title of a product.
   * @param string handle
   *   The handle of a product.
   * @param string url
   *   The URL for a product.
   * @param string description
   *   The description of a product.
   * @param string type
   *   The type of product.
   * @param string vendor
   *   The vendor for a product.
   * @param string image_url
   *   The image URL for a product.
   * @param array variants
   *   Variants has elements:
   *   required id, title,
   *   optional url,sku,price,inventory_quantity,image_url,backorders,visibility
   * @param array images
   *   elements of images are id,url,variant_ids
   * @param string published_at_foreign
   *   The date and time the product was published.
   *
   * @return struct
   *   The API Product response object.
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/products/#create-post_ecommerce_stores_store_id_products
   */
  public function addProduct(store_id, id, title, variants = [] ) {

    return getClient().mailchimpRequest('POST', '/ecommerce/stores/{store_id}/products', arguments);
  }

  /**
   * Update a product in a store.
   *
   * @param string store_id
   *   The store id.
   * @param string product_id
   *   A unique identifier for the product.
   *  @param string title
   *   The title of a product.
   * @param string handle
   *   The handle of a product.
   * @param string url
   *   The URL for a product.
   * @param string description
   *   The description of a product.
   * @param string type
   *   The type of product.
   * @param string vendor
   *   The vendor for a product.
   * @param string image_url
   *   The image URL for a product.
   * @param array variants
   *   Variants has elements:
   *   required id, title,
   *   optional url,sku,price,inventory_quantity,image_url,backorders,visibility
   * @param array images
   *   elements of images are id,url,variant_ids
   * @param string published_at_foreign
   *   The date and time the product was published.
   *
   * @return struct
   *   The API Product response object.
   *
   * @throws \Mailchimp\MailchimpAPIException
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/products/#edit-patch_ecommerce_stores_store_id_products_product_id
   */
  public function updateProduct(store_id, product_id ) {

    return getClient().mailchimpRequest('PATCH', '/ecommerce/stores/{store_id}/products/{product_id}', arguments);
  }

  /**
   * Delete a product.
   *
   * @param string store_id
   *   The store id.
   * @param string product_id
   *   The id for the product of the store.
   *
   * @return struct
   *   The API product response object.
   *
   * @throws \Mailchimp\MailchimpAPIException
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/products/#delete-delete_ecommerce_stores_store_id_products_product_id
   */
  public function deleteProduct(store_id, product_id) {

    return getClient().mailchimpRequest('DELETE', '/ecommerce/stores/{store_id}/products/{product_id}', arguments);
  }


  /**
   * Add a new image to the product.
   *
   * @param string store_id
   *   The store id.
   * @param string product_id
   *   The id for the product of the store.
   * @param string id
   *   A unique identifier for the product variant.
   * @param string url
   *   The URL for a product variant.
   * @param array variant_ids
   *   The list of product variants using the image.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/products/images/
   */
  public function addProductImage(store_id, product_id,id,url) {

    return getClient().mailchimpRequest('POST', '/ecommerce/stores/{store_id}/products/{product_id}/images', arguments);
  }

   /**
   * Get information about a product’s images.
   *
   * @param string store_id
   *   The store id.
   * @param string product_id
   *   The id for the product of the store.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   * @param numeric count
   *   The number of records to return. Default value is 10.
   * @param numeric offset
   *   The number of records from a collection to skip. Iterating over large collections with this parameter can be slow. Default value is 0.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/products/images/#read-get_ecommerce_stores_store_id_products_product_id_images
   */
  public function getProductImages(store_id, product_id) {

    return getClient().mailchimpRequest('GET', '/ecommerce/stores/{store_id}/products/{product_id}/images', arguments);
  }

   /**
   * Get information about a specific product image.
   *
   * @param string store_id
   *   The store id.
   * @param string product_id
   *   The id for the product of the store.
   * @param string image_id
   *   The id for the product image.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/products/images/#read-get_ecommerce_stores_store_id_products_product_id_images_image_id
   */
  public function getProductImage(store_id, product_id,image_id) {

    return getClient().mailchimpRequest('GET', '/ecommerce/stores/{store_id}/products/{product_id}/images/{image_id}', arguments);
  }

   /**
   * Update a product image.
   *
   * @param string store_id
   *   The store id.
   * @param string product_id
   *   The id for the product of the store.
   * @param string image_id
   *   The id for the product image.
   * @param string id
   *   A unique identifier for the product variant.
   * @param string url
   *   The URL for a product variant.
   * @param array variant_ids
   *   The list of product variants using the image.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/products/images/#edit-patch_ecommerce_stores_store_id_products_product_id_images_image_id
   */
  public function updateProductImage(store_id, product_id,image_id) {

    return getClient().mailchimpRequest('PATCH', '/ecommerce/stores/{store_id}/products/{product_id}/images/{image_id}', arguments);
  }


   /**
   * Delete a product image.
   *
   * @param string store_id
   *   The store id.
   * @param string product_id
   *   The id for the product of the store.
   * @param string image_id
   *   The id for the product image.
   *
   * @return struct
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/products/images/#delete-delete_ecommerce_stores_store_id_products_product_id_images_image_id
   */
  public function deleteProductImage(store_id, product_id,image_id) {

    return getClient().mailchimpRequest('DELETE', '/ecommerce/stores/{store_id}/products/{product_id}/images/{image_id}', arguments);
  }

  /**
   * Add a new variant to the product.
   *
   * @param string store_id
   *   The store id.
   * @param string product_id
   *   The id for the product of a store.
   * @param string id
   *   A unique identifier for the product variant.
   * @param string title
   *   The title of a product variant.
   * @param string url
   *   The URL for a product variant.
   * @param string sku
   *   The stock keeping unit (SKU) of a product variant.
   * @param numeric price
   *   The price of a product variant.
   * @param numeric inventory_quantity
   *   The inventory quantity of a product variant.
   * @param string image_url
   *   The image URL for a product variant.
   * @param string backorders
   *   The backorders of a product variant.
   * @param string visibility
   *   The visibility of a product variant.
   *
   * @return struct
   *   The API product response object.
   *
   * @throws \Mailchimp\MailchimpAPIException
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/products/variants/#create-post_ecommerce_stores_store_id_products_product_id_variants
   */
  public function addProductVariant(store_id, product_id, id, title) {
    return getClient().mailchimpRequest('POST', '/ecommerce/stores/{store_id}/products/{product_id}/variants', arguments);
  }

  /**
   * Get information on all variants of a specific product.
   *
   * @param string store_id
   *   The store ID.
   * @param string product_id
   *   The product ID.
   * @param  string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   * @param numeric count
   *   The number of records to return. Default value is 10.
   * @param numeric offset
   *   The number of records from a collection to skip. Iterating over large collections with this parameter can be slow. Default value is 0.
   *
   * @return struct
   *   The API product variant response object.
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/products/variants/#read-get_ecommerce_stores_store_id_products_product_id_variants
   */
  public function getProductVariants(store_id, product_id) {
    return getClient().mailchimpRequest('GET', '/ecommerce/stores/{store_id}/products/{product_id}/variants', arguments);
  }

  /**
   * Get information about a specific variant of a specific product.
   *
   * @param string store_id
   *   The store ID.
   * @param string product_id
   *   The id for the product of a store.
   * @param string variant_id
   *   The id for the product variant.
   * @param string fields
   *   A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
   * @param string exclude_fields
   *   A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
   *
   * @return struct
   *   The API product variant response object.
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/products/variants/#read-get_ecommerce_stores_store_id_products_product_id_variants_variant_id
   */
  public function getProductVariant(store_id, product_id, variant_id) {
    return getClient().mailchimpRequest('GET', '/ecommerce/stores/{store_id}/products/{product_id}/variants/{variant_id}', arguments);
  }

  /**
   * Update a specific variant of a specific product.
   *
   * @param string store_id
   *   The store ID.
   * @param string product_id
   *   The id for the product of a store.
   * @param string variant_id
   *   The id for the product variant.
   * @param string title
   *   The title of a product variant.
   * @param string url
   *   The URL for a product variant.
   * @param string sku
   *   The stock keeping unit (SKU) of a product variant.
   * @param numeric price
   *   The price of a product variant.
   * @param numeric inventory_quantity
   *   The inventory quantity of a product variant.
   * @param string image_url
   *   The image URL for a product variant.
   * @param string backorders
   *   The backorders of a product variant.
   * @param string visibility
   *   The visibility of a product variant.
   *
   * @return struct
   *   The API product variant response object.
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/products/variants/#edit-patch_ecommerce_stores_store_id_products_product_id_variants_variant_id
   */
  public function updateProductVariant(store_id, product_id, variant_id ) {
    return getClient().mailchimpRequest('PATCH', '/ecommerce/stores/{store_id}/products/{product_id}/variants/{variant_id}', arguments);
  }

  /**
   * Delete a specific variant of a specific product.
   *
   * @param string store_id
   *   The store ID.
   * @param string product_id
   *   The product ID.
   * @param string variant_id
   *   The variant ID.
   *
   * @return struct
   *   The API product variant response object.
   *
   * @see https://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/products/variants/#delete-delete_ecommerce_stores_store_id_products_product_id_variants_variant_id
   */
  public function deleteProductVariant(store_id, product_id, variant_id) {
    return getClient().mailchimpRequest('DELETE', '/ecommerce/stores/{store_id}/products/{product_id}/variants/{variant_id}', arguments);
  }

}