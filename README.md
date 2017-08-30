# mailchimpV3
Our goal is to offer a feature complete Mailchimp Api 3.0 Wrapper for Coldfusion Coldbox. It is still work in progress

There are a few Coldfusion implementations for Mailchimp but they are all far from being feature complete.

The api is loosely based on https://github.com/kevindb/cf-mailchimp and https://github.com/thinkshout/mailchimp-api-php

### What's currently supported
Currently supported but not fully tested are
- Automations
- CampaignFolders
- Campaigns
- Conversations
- Ecommerce
- FileManagerFiles
- FileManagerFolders
- Lists
  - AbuseReports
  - Activity
  - Clients (email clients)
  - Growth History
- ListsInterestCategories
- Mailchimp
- Reports
- Search Campaigns (see campaigns)
- Search Members (see lists)
- TemplateFolders
- Templates

## Installation 
This ColdBox Module can be installed using CommandBox:

```
box install mailchimpV3
```



### ColdBox Module
If you are using Coldbox 4.3 or later, we recommend to setup the Api in your central Coldbox.cfc config like

```
 	moduleSettings = {
    		mailchimpV3 = {
        		apikey='YOUR API Key goes here'
    	  	}

```

## Tests
Mailchimp doesn't offer a sandbox, so all test run in the account associated with the API key. It a test fails it might leave a test list with entries which can be safely deleted.

## Usage
```
/**
* A normal ColdBox Event Handler
*/
component{
	property name="mailchimpLists" inject="lists@mailchimpv3";
	
	function index(event,rc,prc){
	
		// gets all lists
    		var results = mailchimpLists.getLists();
	  		writeDump(results);
	  	
	  	// just return email addresses from abuse reports	
		var abuseReports = lists.getAbuseReports('INSERT LIST ID HERE','abuse_reports.email_address');
		writeDump(abuseReports);	  		
		abort;
	}
}

```
## Versions
0.8 30th Aug 2017 Fix for put, updated multiple others

0.7 25th Aug 2017 Added methods in Automations, CampaignFolders, Conversations

## Written by
www.akitogo.com

## Disclaimer
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
