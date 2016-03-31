												Record Manager
  												   README
*****************************************************************************************************************************************************************

The record manager handles tables with a fixed schema. Clients can insert records, delete records, update records, and scan through the records in a table. 
A scan is associated with a search condition and only returns records that match the search condition. 
The record manager accesses the pages of the file through the buffer manager implemented in the Assignment2.

*****************************************************************************************************************************************************************	

The assignment consists of five C files and six header files, a Makefile and a README: 

1. buffer_mgr_stat.c
2. buffer_mgr_stat.h
3. buffer_mgr.c
4. buffer_mgr.h
5. dberror.c
6. dberror.h
7. dt.h
8. storage_mgr.c
9. storage_mgr.h
10. test_assign3_1.c
11. test_helper.h
12. rm_serializer.c
13. test_expr.c
14. expr.c
15. expr.h
16. tables.h
17. record_mgr.c
18. record_mgr.h
19. Makefile
20. README

*****************************************************************************************************************************************************************
Extra Credit:
*****************************************************************************************************************************************************************
Tombstone:

We have implemented tombstone functionality. Whenever a record is deleted from the table a tombstone character is set at the 
start of the record. This lets the record manager know that the record is no longer used and its space can be re-used for some 
other record. In this assignment the deleted record is denoted by a tombstone character '+' and other records as '*'. The functionality is
implemented in insert, delete, and update record methods.

*****************************************************************************************************************************************************************
II. Build and Run
*****************************************************************************************************************************************************************
A. Build
	$ make assign3_1

B. Execute
	$ ./assign3_1

C. Clean
	$ make clean

*****************************************************************************************************************************************************************
III. Design and Implementation
*****************************************************************************************************************************************************************
A. Data Structures

Table_Metadata: A structure consists of the below entities:
	a. Number of tuples in the table
	b. Number of pages in the table
	c. The free pages in the table.
	d. Buffer pool.	

Scan_Metadata: A structure that will be used while scanning data in the records. It consists of the below entities:
	a. An expression that stores the search_condition based on the condition provided by the user. 
	b. Number of records scanned.  
	c. Record id of the record that is scanned.
	

B. Methods

* initRecordManager - Dhruvit Modi (dmodi2@hawk.iit.edu)
       	initializes the record manager using the initStorageManager() function

* shutdownRecordManager - Dhruvit Modi(dmodi2@hawk.iit.edu)
	Frees the memory allocated to table metaData structure

* createTable - Dhruvit Modi (dmodi2@hawk.iit.edu)
	 Created a table with a given schema. Saves the to the disk.
	
* opentable - Dhruvit Modi(dmodi2@hawk.iit.edu)
	Retrives table metadata and schema from the disk. Also initializes buffer pool for further operations. 
	Returns RC_OK when success

* closeTable - Dhruvit Modi(dmodi2@hawk.iit.edu)
	Saves the updated table parameters to the file.Shutdown the buffer pool and set table metaData to NULL.
	On success returns RC_OK.

* deleteTable - Dhruvit Modi(dmodi2@hawk.iit.edu)
	Deletes the table (page file) from the disk.
	

* insertRecord - Dhruvit Modi(dmodi2@hawk.iit.edu)
	Insert a given record in the table.
	
* deleteRecord - Dhruvit Modi(dmodi2@hawk.iit.edu)
	Deletes a given record from the table. Marks a tombstone on that record. This inidicates to the record manager that this space can be re-used to insert another record.

* updateRecord- - Anirudh Deshpande(adeshp17@hawk.iit.edu)
	Updates a given record in the table.
	

* getRecord - Anirudh Deshpande(adeshp17@hawk.iit.edu)
	Fetch a record from the table. The Record ID is used to locate the record in the page file.
	
* startScan - Anirudh Deshpande(adeshp17@hawk.iit.edu)
	Initializes the scan handle for scanning.
	
* next - Anirudh Deshpande(adeshp17@hawk.iit.edu)
	Returns an array of PageNumbers (of size numPages) where the ith element is the number of the page stored in the ith page frame.

* closeScan - Monika Priyadarshini(mpriyad1@hawk.iit.edu)
	Sets the scan handle to NULL.

* getRecordSize - Monika Priyadarshini(mpriyad1@hawk.iit.edu)
	Gets the records size of the schema.

* createSchema - Monika Priyadarshini(mpriyad1@hawk.iit.edu)
	Allocates memory for the schema and set all the paramerters for the schema.

* freeSchema - Monika Priyadarshini(mpriyad1@hawk.iit.edu)
	Free the memory allocated to the schema. 
	
* createRecord - Sahil Chalke (schalke@hawk.iit.edu)
	Allocates space for a new record. Initializes the record.

* freeRecord - Sahil Chalke (schalke@hawk.iit.edu)
	Free the memory allocated to the record

* getAttr - Sahil Chalke (schalke@hawk.iit.edu)
	Retrieves a attribute from a record. Attribute is fetched using the offset calculates by the attrNum.

* setAttr - Sahil Chalke (schalke@hawk.iit.edu)
	Sets a particular attribute in a record. Attribute is fetched using the offset calculates by the attrNum.


________________________________________________________________________________________________________________________________________________________

* Readme: Monika Priyadarshini(mpriyad1@hawk.iit.edu)
* Makefile: Sahil Chalke(schalke@hawk.iit2.edu)
* Testing and Debugging: Dhruvit Modi, Anirudh Deshpande
