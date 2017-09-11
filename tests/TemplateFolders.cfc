component extends="testbox.system.BaseSpec"
{


	/**
	* @hint Executes before the *set* of all tests.
	*/
	function beforeAll(){
		TemplateFolders=application.wirebox.getInstance('TemplateFolders@mailchimpv3');
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
		/* Template Folders														*/
		/*======================================================================*/

		describe("Template Folders", function(){

			// create a Folder
			it("Create a new Templates Folder", function(){
				var results = TemplateFolders.addFolder('testfolder_#minute(now())##second(now())#');
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'name' );
				expect( results ).toHaveKey( 'id' );
				expect( results ).toHaveKey( 'count' );
				folderName = results.name;
				folderId = results.id;
			});

			// get all Folders
			it("Get all Templates Folders", function(){
				var results = TemplateFolders.getFolders();
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'folders' );
				expect( results.folders ).toBeArray();
				expect( arrayLen(results.folders) ).toBeGT(0);
			});

			// get a Folder
			it("Get a Folder", function(){
				var results = TemplateFolders.getFolder(folderId);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'id' );
				expect( results.id ).toBe(folderId);
				expect( results ).toHaveKey( 'name' );
				expect( results.name ).toBe(folderName);
				expect( results ).toHaveKey( 'count' );
				expect( results.count ).toBe(0);
			});

			// update Folder
			it("update Folder", function(){
				var results = TemplateFolders.updateFolder(folderId,'testFolderName');
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'id' );
				expect( results.id ).toBe(folderId);
				expect( results ).toHaveKey( 'name' );
				expect( results.name ).toBe('testFolderName');
			});

			// delete Folder
			it("Delete test folder", function(){
				var results = TemplateFolders.deleteFolder(folderId);
				expect( results ).toBeStruct();
				expect( results ).toBeEmpty();
			});


		});

	}

}