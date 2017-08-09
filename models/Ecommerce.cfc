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
   * @param array parameters
   *   Associative array of optional request parameters.
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
   * @param array parameters
   *   Associative array of optional request parameters.
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
   * @param array store
   *   Associative array of store information.
   *   - list_id (string) The id for the list associated with the store.
   *   - name (string) The name of the store.
   *   - currency_code (string) The three-letter ISO 4217 code for the currency
   *     that the store accepts.
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   *   The API store response object.
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/#create-post_ecommerce_stores
   */
  public function addStore(id, store, batch = FALSE) {

    return getClient().mailchimpRequest('POST', '/ecommerce/stores',arguments, batch);
  }

  /**
   * Updates a store.
   *
   * @param string store_id
   *   The unique identifier for the store.
   * @param string name
   *   The name of the store.
   * @param string currency_code
   *   The three-letter ISO 4217 code for the currency that the store accepts.
   * @param array parameters
   *   Associative array of optional request parameters.
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   *   The API store response object.
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/#edit-patch_ecommerce_stores_store_id
   */
  public function updateStore(store_id, name, currency_code, batch = FALSE) {
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

    return getClient().mailchimpRequest('DELETE', '/ecommerce/stores/{store_id}');
  }

  /**
   * Get information about a store’s carts.
   *
   * @param array store_id
   *   The ID of the store where the carts exist.
   * @param array parameters
   *   Associative array of optional request parameters.
   *
   * @return struct
   *   The API cart response object.
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/carts/#read-get_ecommerce_stores_store_id_carts
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
   * @param array parameters
   *   Associative array of optional request parameters.
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
   * @param array customer
   *   Associative array of customer information.
   *   - id (string): A unique identifier for the customer.
   * @param array cart
   *   Associative array of cart information.
   *   - currency_code (string): The three-letter ISO 4217 currency code.
   *   - order_total (float): The total for the order.
   *   - lines (array): An array of the order's line items.
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   *   The API cart response object.
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/carts/#create-post_ecommerce_stores_store_id_carts
   */
  public function addCart(store_id, id, array customer, array cart, batch = FALSE) {

    return getClient().mailchimpRequest('POST', '/ecommerce/stores/{store_id}/carts', arguments, batch);
  }

  /**
   * Updates a specific cart.
   *
   * @param string store_id
   *   The unique identifier for the store.
   * @param string cart_id
   *   The unique identifier for the cart.
   * @param array parameters
   *   Associative array of optional request parameters.
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
   * @param array parameters
   *   Associative array of optional request parameters.
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
   * @param array parameters
   *   Associative array of optional request parameters.
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
   *   The API cart line response object.
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/carts/lines/#create-post_ecommerce_stores_store_id_carts_cart_id_lines
   */
  public function addCartLine(store_id, cart_id, id, product, batch = FALSE) {

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
   * @param array parameters
   *   An array of optional parameters. See API docs.
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   *   The API cart line response object.
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/carts/lines/#edit-patch_ecommerce_stores_store_id_carts_cart_id_lines_line_id
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
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/carts/lines/#delete-delete_ecommerce_stores_store_id_carts_cart_id_lines_line_id
   */
  public function deleteCartLine(store_id, cart_id, line_id) {
    return getClient().mailchimpRequest('DELETE', '/ecommerce/stores/{store_id}/carts/{cart_id}/lines/{line_id}');
  }

  /**
   * Get information about a store's customers.
   *
   * @param string store_id
   *   The ID of the store.
   * @param array parameters
   *   Associative array of optional request parameters.
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
   * @param array parameters
   *   Associative array of optional request parameters.
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
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   *   The API customer response object.
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/customers/#create-post_ecommerce_stores_store_id_customers
   */
  public function addCustomer(store_id, customer, batch = FALSE) {
    return getClient().mailchimpRequest('POST', '/ecommerce/stores/{store_id}/customers',  customer, batch);
  }

  /**
   * Update a customer.
   *
   * @param string store_id
   *   The ID of the store.
   * @param array customer
   *   An associative array of customer information.
   *   - email_address (string) The customer's email address.
   *   - opt_in_status (boolean) The customer's opt-in status. This value will
   *     never overwrite the opt-in status of a pre-existing MailChimp list
   *     member, but will apply to list members that are added through the
   *     e-commerce API endpoints.
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   *   The API customer response object.
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/customers/#edit-patch_ecommerce_stores_store_id_customers_customer_id
   */
  public function updateCustomer(store_id, customer, batch = FALSE) {

    return getClient().mailchimpRequest('PATCH', '/ecommerce/stores/{store_id}/customers/{customer_id}',  customer, batch);
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

    return getClient().mailchimpRequest('DELETE', '/ecommerce/stores/{store_id}/customers/{customer_id}');
  }

  /**
   * Get information about a store's orders.
   *
   * @param string store_id
   *   The ID of the store.
   * @param array parameters
   *   Associative array of optional request parameters.
   *
   * @return struct
   *   The API order response object.
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/orders/#read-get_ecommerce_stores_store_id_orders
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
   * @param array parameters
   *   Associative array of optional request parameters.
   *
   * @return struct
   *   The API order response object.
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/orders/#read-get_ecommerce_stores_store_id_orders_order_id
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
   * @param array customer
   *   Associative array of customer information.
   *   - id (string): A unique identifier for the customer.
   * @param array order
   *   Associative array of order information.
   *   - currency_code (string): The three-letter ISO 4217 currency code.
   *   - order_total (float): The total for the order.
   *   - lines (array): An array of the order's line items.
   * @param bool batch
   *   TRUE to create a new pending batch operation.
   *
   * @return struct
   *   The API order response object.
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/orders/#create-post_ecommerce_stores_store_id_orders
   */
  public function addOrder(store_id, id, array customer, array order, batch = FALSE) {

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
   *   An array of optional parameters. See API docs.
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
   * @param array parameters
   *   An array of optional parameters. See API docs.
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
   * @param array parameters
   *   An array of optional parameters. See API docs.
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
   * @param array parameters
   *   An array of optional parameters. See API docs.
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
   * @param array parameters
   *   An array of optional parameters. See API docs.
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
   * @param array variants
   *   An array of the product’s variants.
   *   - id (string) A unique identifier for the product variant.
   *   - title (string) The title of a product variant.
   * @param array parameters
   *   An array of additional parameters. See API docs.
   *
   * @return struct
   *   The API Product response object.
   *
   * @throws \Mailchimp\MailchimpAPIException
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
   * @param string id
   *   A unique identifier for the product.
   * @param array variants
   *   An array of the product's variants.
   *   - id (string) A unique identifier for the product variant.
   *   - title (string) The title of a product variant.
   * @param array parameters
   *   An array of additional parameters. See API docs.
   *
   * @return struct
   *   The API Product response object.
   *
   * @throws \Mailchimp\MailchimpAPIException
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/products/#edit-patch_ecommerce_stores_store_id_products_product_id
   */
  public function updateProduct(store_id, id, variants = [] ) {
  

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
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/products/#delete-delete_ecommerce_stores_store_id_products_product_id
   */
  public function deleteProduct(store_id, product_id) {

    return getClient().mailchimpRequest('DELETE', '/ecommerce/stores/{store_id}/products/{product_id}');
  }

  /**
   * Add a variant to a product.
   *
   * @param string store_id
   *   The store id.
   * @param string product_id
   *   The id for the product of a store.
   * @param array parameters
   *   Array of variant information.
   *
   * @return struct
   *   The API product response object.
   *
   * @throws \Mailchimp\MailchimpAPIException
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/products/variants/#create-post_ecommerce_stores_store_id_products_product_id_variants
   */
  public function addProductVariant(store_id, product_id) {
   

    return getClient().mailchimpRequest('POST', '/ecommerce/stores/{store_id}/products/{product_id}/variants', arguments);
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
   * @param array parameters
   *   The data to update the variant in an array.
   *
   * @return struct
   *   The API product variant response object.
   *
   * @throws \Mailchimp\MailchimpAPIException
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/products/variants/#edit-patch_ecommerce_stores_store_id_products_product_id_variants_variant_id
   */
  public function updateProductVariant(store_id, product_id, variant_id ) {
   
    return getClient().mailchimpRequest('PATCH', '/ecommerce/stores/{store_id}/products/{product_id}/variants/{variant_id}', arguments);
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
   * @param array parameters
   *   An array of optional parameters. See API docs.
   *
   * @return struct
   *   The API product variant response object.
   *
   * @throws \Mailchimp\MailchimpAPIException
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/products/variants/#read-get_ecommerce_stores_store_id_products_product_id_variants_variant_id
   */
  public function getProductVariant(store_id, product_id, variant_id) {
    
    return getClient().mailchimpRequest('GET', '/ecommerce/stores/{store_id}/products/{product_id}/variants/{variant_id}', arguments);
  }

  /**
   * Get information on all variants of a specific product.
   *
   * @param string store_id
   *   The store ID.
   * @param string product_id
   *   The product ID.
   *
   * @return struct
   *   The API product variant response object.
   *
   * @throws \Mailchimp\MailchimpAPIException
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/products/variants/#read-get_ecommerce_stores_store_id_products_product_id_variants
   */
  public function getProductVariants(store_id, product_id) {
    return getClient().mailchimpRequest('GET', '/ecommerce/stores/{store_id}/products/{product_id}/variants');
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
   * @throws \Mailchimp\MailchimpAPIException
   *
   * @see http://developer.mailchimp.com/documentation/mailchimp/reference/ecommerce/stores/products/variants/#delete-delete_ecommerce_stores_store_id_products_product_id_variants_variant_id
   */
  public function deleteProductVariant(store_id, product_id, variant_id) {
    return getClient().mailchimpRequest('DELETE', '/ecommerce/stores/{store_id}/products/{product_id}/variants/{variant_id}');
  }

}