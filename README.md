# sqlitemerge
Merges separate sqlite databases (that follows the AppDataCollect app's schema) into (1) master sqlite database file.
See /databases/appdatacollect.db for sample sqlite database that follows the format.<br>

Exports the merged farmland data into a CSV file.

## PREREQUISITES
* PC using Windows OS
* [**GitBash**](https://git-scm.com/downloads) installed and available in your Windows PC.
* AppDataCollect.db's must be available in the /databases directory. <br>
  See the section _**Sqlite Database Files**_, or run **externals.bat**. <br>
* the files: commands.txt, commands_tables.txt and schema_sqlite.sql must be available in
  the /settings directory

## USAGE
1. Run init.bat (1) time only, if there is no maindb.db file yet
2. Grab a copy of any of the (5) CIAT devices' AppDataCollect.db.<br>
   See the section _**Sqlite Database Files**_, or run **externals.bat**. <br>
3. Create sub directories inside /databases numbered 00, 01...0N. Put an AppDataCollect.db inside each. Sample directory and database file hierarchy:<br> 
/databases -> <br>
00/AppDataCollect.db<br>
01/AppDataCollect.db<br>
...<br>
05/AppDataCollect.db
4. Run merge.bat. 
5. Run csv.bat to export consolidated farmland data from all sqlite databases.<br>
Output: **export_csv.csv**


----------

## ALTERNATIVE USAGE
4. Run import.bat. Enter the filename of the sqlite database that 
   you've copied from any of the device.   
5. Run only import.bat for succeeding imports from other AppDataCollect.db's.
6. Run csv.bat to export consolidated farmland data from all sqlite databases.<br>
Output: **export_csv.csv**

## Sqlite Database Files
You can request for access to the (5) CIAT devices' sqlite databases, which are regularly updated here:
https://ciatph@bitbucket.org/ciatph/data.git

Date Created: 20180323<br>
Date Modified: 20180417