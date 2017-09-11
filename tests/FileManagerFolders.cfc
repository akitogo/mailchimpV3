component extends="testbox.system.BaseSpec"
{


	/**
	* @hint Executes before the *set* of all tests.
	*/
	function beforeAll(){
		FileManagerFolders=application.wirebox.getInstance('FileManagerFolders@mailchimpv3');
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
		/* File Manager Folders													*/
		/*======================================================================*/

		describe("File Manager Folders", function(){

			// create Folder
			it("Create a new folder", function(){
				var results = FileManagerFolders.addFolder('testfolder_#minute(now())##second(now())#');
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'file_count' );
				expect( results ).toHaveKey( 'id' );
				expect( results ).toHaveKey( 'name' );
				folderName = results.name;
				folderId=results.id;
			});

			//get a folder
			it("Get a folder", function(){
				var results = FileManagerFolders.getFolder(folderId);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'id' );
				expect( results.id ).toBe(folderId);
				expect( results ).toHaveKey( 'file_count' );
				expect( results.file_count ).toBe(0);
				expect( results.name ).toBe(folderName);
			});

			//update a folder
			it("Update a folder", function(){
				var results = FileManagerFolders.updateFolder(folderId,'testNewName');
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'id' );
				expect( results.id ).toBe(folderId);
				expect( results ).toHaveKey( 'name' );
				expect( results.name ).toBe('testNewName');
			});

			// get all folders
			it("Get all folders", function(){
				var results = FileManagerFolders.getFolders();
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'folders' );
				expect( results.folders ).toBeArray();
				expect( arrayLen(results.folders) ).toBeGT(0);
			});

			// delete Folder
			it("Delete test folder", function(){
				var results = FileManagerFolders.deleteFolder(folderId);
				expect( results ).toBeStruct();
				expect( results ).toBeEmpty();
			});
		});

	}

}