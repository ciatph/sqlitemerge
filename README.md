# sqlitemerge
Merges separate sqlite databases (that follows the AppDataCollect app's schema) into (1) master sqlite database file.

## PREREQUISITES
* Sqlite3 must have been installed in your machine and is available globally
* the files, commands.txt and schema_sqlite.sql must be available in
  the /settings directory

## USAGE
1. Grab a copy of any of the device's AppDataCollect.db
2. Run init.bat (1) time only, if there is no maindb.db file yet
3. Run import.bat. Enter the filename of the sqlite database that 
   you've copied from any of the device.
4. Run only import.bat for succeeding imports from other AppDataCollect.db's

;angel;20180323

