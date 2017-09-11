component extends="testbox.system.BaseSpec"
{


	/**
	* @hint Executes before the *set* of all tests.
	*/
	function beforeAll(){
		ecommerce  = application.wirebox.getInstance('ecommerce@mailchimpv3');
		lists      = application.wirebox.getInstance('lists@mailchimpv3');
		Campaigns  = application.wirebox.getInstance('Campaigns@mailchimpv3');
		Templates  = application.wirebox.getInstance('Templates@mailchimpv3');
	}

	/**
	* @hint Executes after the *set* of all tests.
	*/
	function afterAll(){}

	/*========================================================================*/

	function run( testResults, testBox ){

		/*
		* @hint: Executes before each and every test.
		*/
		beforeEach(function( currentSpec ) {
		});

		/*
		* @hint: Executes after each and every test.
		*/
		afterEach(function( currentSpec ) {
			// do something
		});

		/*======================================================================*/
		/* Ecommerce														    */
		/*======================================================================*/

		describe("Ecommerce", function(){

			//listID = '0d38efbe8a';
			//storeId = 'Store001';
			//storeName = "Test store name 2";
			//cartID = 'Cart001';

			storeId   = 'StoreId_#minute(now())##second(now())#';
			storeName = 'storeName_#minute(now())##second(now())#';
			cartID    = 'cartID_#minute(now())##second(now())#';

			//here we need to create a list

			it("Create a test list", function(){
				newList = lists.addList(
				  	name = 'TEST LIST TO TEST ECOMMERCE'
				  	,contact = {
				  		"company": "Company",
						"address1": "address 1",
						"address2": "address 2",
						"city": "city",
						"state": "state",
						"zip": "zip",
						"country": "country",
						"phone": "+49000000000"
				  	}
				  	,permission_reminder = 'This is the permission reminder'
				  	,use_archive_bar = FALSE
				  	,campaign_defaults ={
						"from_name": "From Test",
						"from_email": "test@test.com",   //not good email
						"subject": "This is the subject",
						"language": "DE"
				  	}
				  	,notify_on_subscribe = 'subscribe@test.com'
				  	,notify_on_unsubscribe = 'unsubscribe@test.com'
				  	,email_type_option = FALSE
				  	,visibility = 'pub'
 				);

				listID = newList.id;

			});



			//stores

			it("Add a new store to your MailChimp account.", function(){
				var results = ecommerce.addStore(id=storeId, list_id=listID, name=storeName, currency_code='EUR');
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'id' );
				expect( results.id ).toBe( storeId );
				expect( results ).toHaveKey( 'name' );
				expect( results.name ).toBe( storeName );
			});

			it("Get information about all stores in the account.", function(){
				var results = ecommerce.getStores();
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'stores' );
				expect( results.stores ).toBeArray();
			});

			it("Get information about a specific store.", function(){
				var results = ecommerce.getStore(storeId);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'id' );
				expect( results.id ).toBe( storeId );
			});


			//check this, doesnt work
			/*it("Update a store.", function(){
				var results = ecommerce.updateStore(storeId = storeId, platform = 'Edited platform');
				writedump(results);abort;
				expect( results ).toBeStruct();
			});*/



            // Customers

			it("Get customers.", function(){
				var results = ecommerce.getCustomers(storeId);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'customers' );
				expect( results.customers ).toBeArray();
			});

			it("Add a new customer to a store.", function(){
				custID = 'id_#minute(now())##second(now())#';
				email  = 'test_#minute(now())##second(now())#@test.com';
				var results = ecommerce.addCustomer(store_id=storeId, id=custID, email_address=email, opt_in_status=true);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'id' );
				expect( results.id ).toBe( custID );
			});

			it("Delete a customer.", function(){
				//add a new one
				var custID = 'id2_#minute(now())##second(now())#';
				email  = 'test2_#minute(now())##second(now())#@test.com';
				var results = ecommerce.addCustomer(store_id=storeId, id=custID, email_address=email, opt_in_status=true);
				var results = ecommerce.deleteCustomer(store_id=storeId,customer_id=custID);
				expect( results ).toBeStruct();
				expect( results ).toBeEmpty();
			});


			it("Get customer.", function(){
				var results = ecommerce.getCustomer(storeId,custID);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'id' );
				expect( results.id ).toBe( custID );
			});

			it("Update a customer.", function(){
				var results = ecommerce.updateCustomer(store_id=storeId,customer_id=custID,first_name='newName');
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'first_name' );
				expect( results.first_name ).toBe( 'newName' );
			});




			// Products

			it("Add a new product to a store.", function(){

				productID = 'product_id_#minute(now())##second(now())#';
				productTitle = 'product_title_#minute(now())##second(now())#';

				var results = ecommerce.addProduct(
					store_id = storeID,
					id = productID,
					title  = productTitle,
					variants = [
					             {
					             	'id'    = productID,
					             	'title' = productTitle
					             }
					           ]
                );
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'variants' );
				expect( results.variants ).toBeArray();
			});

			it("Get information about a specific product.", function(){
				var results = ecommerce.getProduct(storeId,productID);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'id' );
				expect( results.id ).toBe( productID );
			});


			it("Update a specific product.", function(){

				newProductTitle = 'newTitle';

				var results = ecommerce.updateProduct(
					store_id   = storeID,
					product_id = productID,
					title = newProductTitle
                );
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'title' );
				expect( results.title ).toBe( newProductTitle );
			});



			it("Get information about a store’s products.", function(){
				var results = ecommerce.getProducts(storeId);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'products' );
				expect( results.products ).toBeArray();
			});



			// product images

			it("Add a new image to the product.", function(){
				imageID = 'Image_#minute(now())##second(now())#';
				imageUrl = 'http://www.somesite.com/image_url_#minute(now())##second(now())#.jpg';
				var results = ecommerce.addProductImage(store_id=storeId,product_id=productID,id=imageID,url=imageUrl);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'url' );
				expect( results.url ).toBe( imageUrl );
			});

			it("Get information about a product’s images.", function(){
				var results = ecommerce.getProductImages(store_id=storeId,product_id=productID);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'images' );
				expect( results.images ).toBeArray();
			});

			it("Get information about a specific product image.", function(){
				var results = ecommerce.getProductImage(store_id=storeId,product_id=productID,image_id=imageID);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'url' );
				expect( results.url ).toBe( imageUrl );
			});

			it("Update a product image.", function(){
				newUrl = 'http://www.somesite/new_image_url_#minute(now())##second(now())#.jpg';
				var results = ecommerce.updateProductImage(store_id=storeId,product_id=productID,image_id=imageID,url=newUrl);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'url' );
				expect( results.url ).toBe( newUrl );
			});



			// product variants

			it("Add a new variant to the product.", function(){
				productVariantID = 'Product_Variant_#minute(now())##second(now())#';
				productVariantTitle = 'Product_Variant_Title_#minute(now())##second(now())#';
				var results = ecommerce.addProductVariant(store_id=storeId,product_id=productID,image_id=imageID,id=productVariantID,title=productVariantTitle);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'title' );
				expect( results.title ).toBe( productVariantTitle );
			});

			it("Get information about a product’s variants.", function(){
				var results = ecommerce.getProductVariants(store_id=storeId,product_id=productID);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'variants' );
				expect( results.variants ).toBeArray();
			});

			it("Get information about a specific product variant.", function(){
				var results = ecommerce.getProductVariant(store_id=storeId,product_id=productID,variant_id=productVariantID);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'id' );
				expect( results.id ).toBe( productVariantID );
			});

			it("Update a product variant.", function(){
				newVariantTitle = 'new_variant_title_#minute(now())##second(now())#';
				var results = ecommerce.updateProductVariant(store_id=storeId,product_id=productID,variant_id=productVariantID,title=newVariantTitle);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'title' );
				expect( results.title ).toBe( newVariantTitle );
			});



			// Carts

			it("Add a new cart to a store.", function(){
				var results = ecommerce.addCart(
				  store_id=storeId,
				  id=cartID,
				  customer={
				  	          'id'=custID
				           },
				  currency_code = 'EUR',
				  order_total = 60,
				  lines=[  {
					  	       'id'='item001',
					  	       'product_id'=productID,
					  	       'product_variant_id'=productID,
					  	       'quantity'=3,
					  	       'price'=20
							}
				        ]
				);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'id' );
				expect( results.id ).toBe( cartID );
			});

			it("Get information about a store’s carts.", function(){
				var results = ecommerce.getCarts(storeId);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'carts' );
				expect( results.carts ).toBeArray();
			});

			it("Get information about a specific cart.", function(){
				var results = ecommerce.getCart(storeId,cartID);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'customer' );
				expect( results ).toHaveKey( 'id' );
				expect( results.id ).toBe( cartID );
			});

			it("Update a specific cart.", function(){
				var results = ecommerce.updateCart(store_id=storeId,cart_id=cartID,currency_code='USD');
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'currency_code' );
				expect( results.currency_code ).toBe( 'USD' );
			});


			// cart lines

			it("Add a new line item to an existing cart.", function(){

				//first create a new product

				productID_2 = 'product_id_#minute(now())##second(now())#';
				productTitle_2 = 'product_title_#minute(now())##second(now())#';

				var results = ecommerce.addProduct(
					store_id = storeID,
					id = productID_2,
					title  = productTitle_2,
					variants = [
					             {
					             	'id'    = productID_2,
					             	'title' = productTitle_2
					             }
					           ]
                );

				lineId = 'line_id_#minute(now())##second(now())#';

				var results = ecommerce.addCartLine(
					store_id=storeId,
					cart_id=cartID,
				    id= lineId,
				    product_id=productID_2,
				    product_variant_id=productID_2,
				    quantity=2,
				    price= 40
                );

				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'product_title' );
				expect( results.product_title ).toBe( productTitle_2 );

			});

			it("Get information about a cart’s line items.", function(){
				var results = ecommerce.getCartLines(storeId,cartID);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'lines' );
				expect( results.lines ).toBeArray();
			});

			it("Get information about a specific cart line item.", function(){
				var results = ecommerce.getCartLine(storeId,cartID,lineId);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'id' );
				expect( results.id ).toBe( lineId );
			});

			it("Update a specific cart line item.", function(){
				var results = ecommerce.updateCartLine(store_id=storeId,cart_id=cartID,line_id=lineId,price=77);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'price' );
				expect( results.price ).toBe( 77 );
			});


			// orders


			it("Add a new order to a store.", function(){

				orderId = 'order_id_#minute(now())##second(now())#';
				customerID = 'customer_id_#minute(now())##second(now())#';
				//If the customer doesn’t exist in the store, a new customer will be created.
				customer = {
					   'id'=customerID,
					   	'email_address' = 'email_#minute(now())##second(now())#@test.com',
					   	'opt_in_status' = true
					   	};
				orderLineItemId = 'orderLineItemId_#minute(now())##second(now())#';
				//create lines
				newLines = [  {
						  	       'id'=orderLineItemId,
						  	       'product_id'=productID,
						  	       'product_variant_id'=productID,
						  	       'quantity'=1,
						  	       'price'=100
							   }
				           ];

				var results = ecommerce.addOrder(
				  store_id=storeId,
				  id=orderId,
				  customer=customer,
				  currency_code='EUR',
				  order_total=100,
				  lines=newLines
				  );
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'id' );
				expect( results.id ).toBe( orderId );

			});


			it("Get information about a store’s orders.", function(){
				var results = ecommerce.getOrders(store_id=storeId);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'orders' );
				expect( results.orders ).toBeArray();
			});

			it("Get information about a specific order.", function(){
				var results = ecommerce.getOrder(store_id=storeId,order_id=orderID);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'id' );
				expect( results.id ).toBe( orderID );
			});

			it("Update a specific order.", function(){
				newOrderUrl='http://www.somesite.com/order_#minute(now())##second(now())#.html';
				var results = ecommerce.updateOrder(store_id=storeId,order_id=orderID,order_url=newOrderUrl);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'order_url' );
				expect( results.order_url ).toBe( newOrderUrl );
			});




			// order lines


			it("Add a new line item to an existing order.", function(){

				orderLineItemId2 = 'orderLineItemId_#minute(now())##second(now())#';

				var results = ecommerce.addOrderLine(
					store_id = storeId,
					order_id = orderID,
					id = orderLineItemId2,
					product_id = productID,
					product_variant_id = productID,
					quantity = 5,
					price = 20
					);

				expect( results ).toBeStruct();
				expect( results ).tohaveKey( 'id' );
				expect( results.id ).toBe( orderLineItemId2 );
			});


			it("Get information about an order’s line items.", function(){
				var results = ecommerce.getOrderLines(store_id=storeId,order_id=orderID);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'lines' );
				expect( results.lines ).toBeArray();

				lineID = results.lines[1].id; //need this for the next tests
			});

			it("Get information about a specific order line item.", function(){
				var results = ecommerce.getOrderLine(store_id=storeId,order_id=orderID,line_id=lineID);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'id' );
				expect( results.id ).toBe( lineID );
			});

			it("Update a specific order line item.", function(){
				var results = ecommerce.updateOrderLine(store_id=storeId,order_id=orderID,line_id=lineID,price=105);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'price' );
				expect( results.price ).toBe( 105 );
			});






			//clean up and testing delete methods

			it("Delete a specific order line item.", function(){
				var results = ecommerce.deleteOrderLine(store_id=storeId,order_id=orderID,line_id=lineID);
				expect( results ).toBeStruct();
				expect( results ).toBeEmpty();
			});


			/*it("Delete an order.", function(){
				var results = ecommerce.deleteOrder(store_id=storeId,order_id=orderID);
				expect( results ).toBeStruct();
				expect( results ).toBeEmpty();
			});

			it("Delete a specific cart line item.", function(){
				var results = ecommerce.deleteCartLine(storeId,cartID,lineId);
				expect( results ).toBeStruct();
				expect( results ).toBeEmpty();
			});

			it("Delete a cart.", function(){
				var results = ecommerce.deleteCart(store_id=storeId,cart_id=cartID);
				expect( results ).toBeStruct();
				expect( results ).toBeEmpty();
			});*/

			it("Delete a product variant.", function(){
				var results = ecommerce.deleteProductVariant(store_id=storeId,product_id=productID,variant_id=productVariantID);
				expect( results ).toBeStruct();
				expect( results ).toBeEmpty();
			});

			it("Delete a product image.", function(){
				var results = ecommerce.deleteProductImage(store_id=storeId,product_id=productID,image_id=imageID);
				expect( results ).toBeStruct();
				expect( results ).toBeEmpty();
			});

			it("Delete a product.", function(){
				var results = ecommerce.deleteProduct(store_id=storeId, product_id=productID);
				expect( results ).toBeStruct();
				expect( results ).toBeEmpty();
			});

			it("Delete a store.", function(){
				var results = ecommerce.deleteStore(storeId);
				expect( results ).toBeempty();
			});

			it("Delete list", function(){
				var results = lists.deleteList(list_id = listID);
				expect( results ).toBeStruct();
				expect( results ).toBeEmpty();
			});

		});



	}

}