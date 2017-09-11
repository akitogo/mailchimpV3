component extends="testbox.system.BaseSpec"
{


	/**
	* @hint Executes before the *set* of all tests.
	*/
	function beforeAll(){
		FileManagerFiles=application.wirebox.getInstance('FileManagerFiles@mailchimpv3');
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
		/* File Manager Files												    */
		/*======================================================================*/

		describe("File Manager Files", function(){

			// add File by path
			it("Add a File by path", function(){
				//creating an image and give it random name
				var img = imageNew("",500,500,"argb");
				fileName = 'fileName_#minute(now())##second(now())#.jpg';
				imageWrite(img,fileName);
				newFilePath = expandPath('./modules/mailchimpV3/tests/'&fileName);

				//we need to create a Folder:
				var newFolder = FileManagerFolders.addFolder('testfolder_#minute(now())##second(now())#');
				newFolderId=newFolder.id;

				var results = FileManagerFiles.addFile(folder_id=newFolderId, name=fileName, file_data=newFilePath);
				fileDelete(fileName);

				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'id' );
				fileId=results.id;
				expect( results ).toHaveKey( 'type' );
				expect( results.type ).toBe( 'image' );
				expect( results ).toHaveKey( 'name' );
				expect( results.name ).toBe( fileName );
			});

			// add File binary
			it("Add a File binary", function(){
				//creating an image and give it random name
				var img = imageNew("",500,500,"argb");
				var fileName2 = 'fileName_#minute(now())##second(now())#.jpg';
				imageWrite(img,fileName2);
				var fileBinary = FileReadBinary(expandPath('./modules/mailchimpV3/tests/'&fileName2));

				var results = FileManagerFiles.addFile(folder_id=newFolderId, name=FileName2, file_data=fileBinary);
				fileDelete(fileName2);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'id' );
				fileId2=results.id;
				expect( results ).toHaveKey( 'type' );
				expect( results.type ).toBe( 'image' );
				expect( results ).toHaveKey( 'name' );
				expect( results.name ).toBe( FileName2 );
			});

			// get all Files
			it("Get all Files", function(){
				var results = FileManagerFiles.getFiles();
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'files' );
				expect( results.files ).toBeArray();
				expect( arrayLen(results.files) ).toBeGT(0);
			});

			// get a File
			it("Get a File", function(){
				//get a File from the first test, id=fileId, file name = fileName
				var results = FileManagerFiles.getFile(fileId);
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'id' );
				expect( results.id ).toBe(fileId);
				expect( results ).toHaveKey( 'name' );
				expect( results.name ).toBe(fileName);
				expect( results ).toHaveKey( 'folder_id' );
				expect( results.folder_id ).toBe(newFolderId);
			});

			// update a File
			it("Update a File Name", function(){
				var results = FileManagerFiles.updateFile(file_id=fileId,folder_id=newFolderId,name='TestFileName');
				expect( results ).toBeStruct();
				expect( results ).toHaveKey( 'id' );
				expect( results.id ).toBe(fileId);
				expect( results ).toHaveKey( 'name' );
				expect( results.name ).toBe('TestFileName');
				expect( results ).toHaveKey( 'folder_id' );
				expect( results.folder_id ).toBe(newFolderId);
			});

			// delete both created files and created Folder
			it("Delete a File", function(){
				var results1 = FileManagerFiles.deleteFile(fileId);
				expect( results1 ).toBeStruct();
				expect( results1 ).toBeEmpty();
				var results2 = FileManagerFiles.deleteFile(fileId2);
				expect( results2 ).toBeStruct();
				expect( results2 ).toBeEmpty();
				var results3 = FileManagerFolders.deleteFolder(newFolderId);
				expect( results3 ).toBeStruct();
				expect( results3 ).toBeEmpty();

			});

		});

	}

}