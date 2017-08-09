# mailchimpV3
Our goal is to offer a feature complete Mailchimp Api 3.0 Wrapper for Coldfusion Coldbox. It is still work in progress

There are a few Coldfusion implementations but they are all far from being feature complete.

The api is loosely based on https://github.com/kevindb/cf-mailchimp and https://github.com/thinkshout/mailchimp-api-php

### What's currently supported
Currently supported but not fully tested are
- Automations
- CampaignFolders
- Campaigns
- Conversations
- Ecommerce
- Lists
- ListsInterestCategories
- Mailchimp
- Reports
- TemplateFolders
- Templates

## Installation 
This API can be installed as as a ColdBox Module.  It requires a simple CommandBox command:

```
box install mailchimpV3
```



### ColdBox Module
If you are using Coldbox 4.3 or later, we recommend to setup the api in in you central config like

```
 	moduleSettings = {
    		mailchimpV3 = {
        		apikey='YOUR API Key goes here'
    	  	}

```
## Usage
```
/**
* A normal ColdBox Event Handler
*/
component{
	property name="mailchimpLists" inject="lists@mailchimpv3";
	
	function index(event,rc,prc){
	
		// gets all lists
    		var results = lists.getLists();
	  	writeDump(results);
		abort;
	}
}

```

## Written by
www.akitogo.com

## Disclaimer
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
